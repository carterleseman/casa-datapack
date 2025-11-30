import os
import re
import json
import time
import uuid
import requests
from mcrcon import MCRcon
from dotenv import load_dotenv

load_dotenv("/home/cale/mc-whitelist/.env")

LOG_PATH = "/home/cale/minecraft/logs/latest.log"
ADV_DIR = "/home/cale/minecraft/world_1_21_11/datapacks/casa_advancements/data/casa/advancement/cales.casa/"
RCON_HOST = "127.0.0.1"
RCON_PORT = 25575
RCON_PASSWORD = os.getenv("RCON_PASSWORD")

def get_uuid(username):
    """Fetch UUID from Mojang API and convert to int array for NBT"""
    try:
        r = requests.get(f"https://api.mojang.com/users/profiles/minecraft/{username}", timeout=5)
        if r.status_code == 200:
            data = r.json()
            uuid = data["id"]
            
            return uuid_to_ints(uuid)
        return None
    except:
        return None
    
def uuid_to_ints(uuid_str):
    u = uuid.UUID(uuid_str)

    msb = (u.int >> 64) & 0xFFFFFFFFFFFFFFFF
    lsb = u.int & 0xFFFFFFFFFFFFFFFF

    msb_signed = msb - (1 << 64) if msb >> 63 else msb
    lsb_signed = lsb - (1 << 64) if lsb >> 63 else lsb

    int_array = [
        (msb_signed >> 32) & 0xFFFFFFFF,
        msb_signed & 0xFFFFFFFF,
        (lsb_signed >> 32) & 0xFFFFFFFF,
        lsb_signed & 0xFFFFFFFF
    ]

    int_array = [i - (1 << 32) if i >> 31 else i for i in int_array]

    return int_array
    
def write_advancement(username, uuid_ints):
    path = os.path.join(ADV_DIR, f"kill_{username}.json")

    adv = {
        "display": {
            "title": f"Kill {username}",
            "description": f"Kill {username}",
            "icon": {
                "id": "minecraft:player_head",
                "components": {
                    "minecraft:profile": {
                        "name": username
                    }
                }
            }
        },
        "criteria": {
            "kill_target": {
                "trigger": "minecraft:player_killed_entity",
                "conditions": {
                    "entity": {
                        "type": "minecraft:player",
                        "nbt": f'{{UUID:[I;{uuid_ints[0]},{uuid_ints[1]},{uuid_ints[2]},{uuid_ints[3]}]}}'
                    }
                }
            }
        },
        "parent": "casa:cales.casa/root"
    }

    with open(path, "w") as f:
        json.dump(adv, f, indent=4)

def delete_advancement(username):
    path = os.path.join(ADV_DIR, f"kill_{username}.json")
    if os.path.exists(path):
        os.remove(path)

def reload():
    try:
        with MCRcon(RCON_HOST, RCON_PASSWORD, RCON_PORT) as mcr:
            mcr.command("/reload")
    except Exception as e:
        pass

def follow(path):
    f = open(path, "r")
    f.seek(0, os.SEEK_END)

    while True:
        line = f.readline()
        if not line:
            if not os.path.exists(path):
                time.sleep(1)
                continue
            try:
                new = open(path, "r")
                f.close()
                f = new
            except:
                time.sleep(1)
            continue

        yield line

def main():
    whitelist_add = re.compile(
        r"\[\w+:\s+Added\s+([^\]]+?)\s+to the whitelist\]", re.IGNORECASE
    )
    whitelist_remove = re.compile(
        r"\[\w+:\s+Removed\s+([^\]]+?)\s+from the whitelist\]", re.IGNORECASE
    )
    server_empty = re.compile(r"Server empty for 60 seconds, pausing", re.IGNORECASE)

    reload_pending = False

    for line in follow(LOG_PATH):
        
        add_match = whitelist_add.search(line)
        if add_match:
            username = add_match.group(1)
            uuid = get_uuid(username)
            if uuid:
                write_advancement(username, uuid)
                reload_pending = True
        
        remove_match = whitelist_remove.search(line)
        if remove_match:
            username = remove_match.group(1)
            delete_advancement(username)
            reload_pending = True

        if server_empty.search(line):
            if reload_pending:
                reload()
                reload_pending = False

if __name__ == "__main__":
    main()