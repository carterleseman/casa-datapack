import json

materials = ["leather", "chainmail", "iron", "golden", "diamond", "netherite"]
pieces = ["helmet", "chestplate", "leggings", "boots"]
builtin_trim_materials = ["quartz", "iron", "netherite", "redstone", "copper", "gold", "emerald", "diamond", "lapis", "amethyst", "resin"]

for material in materials:
    for piece in pieces:
        # model
        with open(f"assets/minecraft/models/item/{material}_{piece}_echo_trim.json", "w+") as f:
            json.dump({
                "parent": "minecraft:item/generated",
                "textures": {
                    "layer0": f"minecraft:item/{material}_{piece}",
                    "layer1": f"minecraft:trims/items/{piece}_trim_echo_1"
                }
            }, f)
        # item model (1.21.4)
        with open(f"assets/minecraft/items/{material}_{piece}.json", "w+") as f:
            json.dump({
                "model": {
                    "type": "minecraft:select",
                    "cases": [
                        {
                            "model": {
                                "type": "minecraft:model",
                                "model": f"minecraft:item/{material}_{piece}_echo_trim"
                            },
                            "when": ["echo_trim:echo_1", "echo_trim:echo_2", "echo_trim:echo_3", "echo_trim:echo_4", "echo_trim:echo_5", "echo_trim:echo_6", "echo_trim:echo_7", "echo_trim:echo_8", "echo_trim:echo_9", "echo_trim:echo_10", "echo_trim:echo_11", "echo_trim:echo_12", "echo_trim:echo_13", "echo_trim:echo_14", "echo_trim:echo_15", "echo_trim:echo_16"]
                        },
                        *({
                            "model": {
                                "type": "minecraft:model",
                                "model": f"minecraft:item/{material}_{piece}_{trim_material}_trim",
                                "tints": [
                                    {
                                        "type": "minecraft:dye",
                                        "default": -6265536
                                    }
                                ] if material == "leather" else []
                            },
                            "when": f"minecraft:{trim_material}"
                        } for trim_material in builtin_trim_materials),
                    ],
                    "fallback": {
                        "type": "minecraft:model",
                        "model": f"minecraft:item/{material}_{piece}",
                        "tints": [
                            {
                                "type": "minecraft:dye",
                                "default": -6265536
                            }
                        ] if material == "leather" else []
                    },
                    "property": "minecraft:trim_material"
                }
            }, f)