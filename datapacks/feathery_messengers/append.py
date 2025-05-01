import json

def append_to_items(file_path, new_items, prefix="minecraft:", suffix=""):
    with open(file_path, 'r') as file:
        data = json.load(file)

    values = data.get('values', [])

    for item in new_items:
        prefixed = f"{prefix}{item}{suffix}"
        if prefixed not in values:
            values.append(prefixed)

    data['values'] = values
    with open(file_path, 'w') as file:
        json.dump(data, file, indent=4)

file_path = "./datapacks/feathery_messengers/data/owls/tags/item/all_but_air.json"

pottery_sherds = ["archer", "miner", "prize", "skull", "arms_up", "brewer", "angler", "shelter", "shelter", "snort", "blade", "explorer", "mourner", "plenty", "burn", "danger", "friend", "heart", "heartbreak", "howl", "sheaf", "flow", "guster", "scrape"]
# append_to_items(file_path, pottery_sherds, suffix="_pottery_sherd")

armor_trims = ["sentry", "vex", "wild", "coast", "dune", "ward", "silence", "snout", "rib", "eye", "spire", "flow", "bolt", "wayfinder", "raiser", "shaper", "host"]
# append_to_items(file_path, armor_trims, suffix="_armor_trim_smithing_template")

bundles = ["white", "orange", "magenta", "light_blue", "yellow", "lime", "pink", "gray", "light_gray", "cyan", "purple", "blue", "brown", "green", "red", "black"]
# append_to_items(file_path, bundles, suffix="_bundle")

copper_variations = ["exposed", "waxed", "oxidized", "weathered", "waxed_exposed", "waxed_weathered", "waxed_oxidized"]
# append_to_items(file_path, copper_variations, suffix="_chiseled_copper")
# append_to_items(file_path, copper_variations, suffix="_copper_bulb")
# append_to_items(file_path, copper_variations, suffix="_copper_door")
# append_to_items(file_path, copper_variations, suffix="_copper_grate")
# append_to_items(file_path, copper_variations, suffix="_copper_trapdoor")