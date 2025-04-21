# summon a marker to server as the meerkat
summon minecraft:marker ~ ~ ~ { Tags: [biome_vote.meerkat, biome_vote.meerkat.setup] }

# summon the item displays before calling `ai/setup`, which will configure these to match the marker's uuid
summon minecraft:item_display ~ ~ ~ { Tags: [biome_vote.ai.model, biome_vote.ai.model.setup, biome_vote.meerkat.body], item: { id: "minecraft:stick", components: { "minecraft:item_model": "biome_vote:entity/meerkat/body" } }, transformation: { translation: [0d, 0.5d, 0d], left_rotation: [0d, 0d, 0d, 1d], right_rotation: [0d, 0d, 0d, 1d], scale: [1d, 1d, 1d] }, teleport_duration: 2, interpolation_duration: 5 }
summon minecraft:item_display ~ ~ ~ { Tags: [biome_vote.ai.model, biome_vote.ai.model.setup, biome_vote.meerkat.head], item: { id: "minecraft:stick", components: { "minecraft:item_model": "biome_vote:entity/meerkat/head" } }, transformation: { translation: [0d, 0.5d, 0d], left_rotation: [0d, 0d, 0d, 1d], right_rotation: [0d, 0d, 0d, 1d], scale: [1d, 1d, 1d] }, teleport_duration: 2, interpolation_duration: 5 }
summon minecraft:item_display ~ ~ ~ { Tags: [biome_vote.ai.model, biome_vote.ai.model.setup, biome_vote.meerkat.leg_left], item: { id: "minecraft:stick", components: { "minecraft:item_model": "biome_vote:entity/meerkat/leg_left" } }, transformation: { translation: [0d, 0.5d, 0d], left_rotation: [0d, 0d, 0d, 1d], right_rotation: [0d, 0d, 0d, 1d], scale: [1d, 1d, 1d] }, teleport_duration: 2, interpolation_duration: 5 }
summon minecraft:item_display ~ ~ ~ { Tags: [biome_vote.ai.model, biome_vote.ai.model.setup, biome_vote.meerkat.leg_right], item: { id: "minecraft:stick", components: { "minecraft:item_model": "biome_vote:entity/meerkat/leg_right" } }, transformation: { translation: [0d, 0.5d, 0d], left_rotation: [0d, 0d, 0d, 1d], right_rotation: [0d, 0d, 0d, 1d], scale: [1d, 1d, 1d] }, teleport_duration: 2, interpolation_duration: 5 }
summon minecraft:item_display ~ ~ ~ { Tags: [biome_vote.ai.model, biome_vote.ai.model.setup, biome_vote.meerkat.arm_left], item: { id: "minecraft:stick", components: { "minecraft:item_model": "biome_vote:entity/meerkat/arm_left" } }, transformation: { translation: [0d, 0.5d, 0d], left_rotation: [0d, 0d, 0d, 1d], right_rotation: [0d, 0d, 0d, 1d], scale: [1d, 1d, 1d] }, teleport_duration: 2, interpolation_duration: 5 }
summon minecraft:item_display ~ ~ ~ { Tags: [biome_vote.ai.model, biome_vote.ai.model.setup, biome_vote.meerkat.arm_right], item: { id: "minecraft:stick", components: { "minecraft:item_model": "biome_vote:entity/meerkat/arm_right" } }, transformation: { translation: [0d, 0.5d, 0d], left_rotation: [0d, 0d, 0d, 1d], right_rotation: [0d, 0d, 0d, 1d], scale: [1d, 1d, 1d] }, teleport_duration: 2, interpolation_duration: 5 }

# setup the mob ai
execute as @e[type=minecraft:marker, tag=biome_vote.meerkat.setup] at @s run function biome_vote:ai/setup { mimic: "minecraft:ocelot", mimic_scale: 0.75, wander_scale: 0.5, wander_speed: 0.7, width: 0.75, height: 0.75, mimic_attributes: '{ id: "minecraft:movement_speed", base: 0.2 }', wander_attributes: '{ id: "minecraft:movement_speed", base: 0.8 }', health: 10, hurt_sound: '"minecraft:entity.axolotl.hurt"' }

# set the current xyz pos as its home target
execute as @n[type=minecraft:marker, tag=biome_vote.meerkat.setup] store result entity @s data.x int 1 run data get entity @s Pos[0]
execute as @n[type=minecraft:marker, tag=biome_vote.meerkat.setup] store result entity @s data.y int 1 run data get entity @s Pos[1]
execute as @n[type=minecraft:marker, tag=biome_vote.meerkat.setup] store result entity @s data.z int 1 run data get entity @s Pos[2]

# cleanup the setup tag
tag @e[type=minecraft:marker, tag=biome_vote.meerkat.setup] remove biome_vote.meerkat.setup