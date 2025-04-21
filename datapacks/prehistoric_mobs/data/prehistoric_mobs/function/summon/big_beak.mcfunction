summon minecraft:mule ~ ~ ~ { Tags: ["big_beak.setup"], Silent: true, Age: -1000, active_effects: [{ id: "minecraft:invisibility", duration: 2147483647, show_particles: false }], attributes: [{ id: "minecraft:gravity", base: 0.01 }, { id: "minecraft:scale", base: 1 }, { id: "minecraft:fall_damage_multiplier", base: 0 }] }

summon minecraft:item_display ~ ~ ~ { Tags: ["big_beak.model_setup", "big_beak.body"], item: { id: "minecraft:barrier", components: { "minecraft:item_model": "prehistoric_mobs:big_beak_body" } }, interpolation_duration: 4, teleport_duration: 1, shadow_radius: 0.5, shadow_strength: 1 }
summon minecraft:item_display ~ ~ ~ { Tags: ["big_beak.model_setup", "big_beak.head"], item: { id: "minecraft:barrier", components: { "minecraft:item_model": "prehistoric_mobs:big_beak_head" } }, transformation: { translation: [0f, 0f, 0.5f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f], scale: [1f, 1f, 1f] }, interpolation_duration: 4, teleport_duration: 1 }
summon minecraft:item_display ~ ~ ~ { Tags: ["big_beak.model_setup", "big_beak.foot_left"], item: { id: "minecraft:barrier", components: { "minecraft:item_model": "prehistoric_mobs:big_beak_foot_left" } }, interpolation_duration: 4, teleport_duration: 1 }
summon minecraft:item_display ~ ~ ~ { Tags: ["big_beak.model_setup", "big_beak.foot_right"], item: { id: "minecraft:barrier", components: { "minecraft:item_model": "prehistoric_mobs:big_beak_foot_right" } }, interpolation_duration: 4, teleport_duration: 1 }
summon minecraft:item_display ~ ~ ~ { Tags: ["big_beak.model_setup", "big_beak.wing_left"], item: { id: "minecraft:barrier", components: { "minecraft:item_model": "prehistoric_mobs:big_beak_wing_left" } }, transformation: { translation: [0.375f, 0.75f, 0f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f], scale: [1f, 1f, 1f] }, interpolation_duration: 4, teleport_duration: 1 }
summon minecraft:item_display ~ ~ ~ { Tags: ["big_beak.model_setup", "big_beak.wing_right"], item: { id: "minecraft:barrier", components: { "minecraft:item_model": "prehistoric_mobs:big_beak_wing_right" } }, transformation: { translation: [-0.375f, 0.75f, 0f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f], scale: [1f, 1f, 1f] }, interpolation_duration: 4, teleport_duration: 1 }
summon minecraft:item_display ~ ~ ~ { Tags: ["big_beak.model_setup", "big_beak.saddle"], item: { id: "minecraft:barrier", components: { "minecraft:item_model": "prehistoric_mobs:big_beak_saddle" } }, interpolation_duration: 4, teleport_duration: 1 }

execute as @e[type=minecraft:mule, tag=big_beak.setup] store result score @s prehistoric_mobs.uuid_least run data get entity @s UUID[0]
execute as @e[type=minecraft:mule, tag=big_beak.setup] store result score @s prehistoric_mobs.uuid_most run data get entity @s UUID[3]

execute as @e[type=minecraft:item_display, tag=big_beak.model_setup] store result score @s prehistoric_mobs.uuid_least run data get entity @n[type=minecraft:mule, tag=big_beak.setup] UUID[0]
execute as @e[type=minecraft:item_display, tag=big_beak.model_setup] store result score @s prehistoric_mobs.uuid_most run data get entity @n[type=minecraft:mule, tag=big_beak.setup] UUID[3]

scoreboard players set @e[type=minecraft:item_display, tag=big_beak.model_setup] prehistoric_mobs.animation 1

execute as @e[type=minecraft:mule, tag=big_beak.setup] store result score @s prehistoric_mobs.pos_x run data get entity @s Pos[0] 100
execute as @e[type=minecraft:mule, tag=big_beak.setup] store result score @s prehistoric_mobs.pos_y run data get entity @s Pos[1] 100
execute as @e[type=minecraft:mule, tag=big_beak.setup] store result score @s prehistoric_mobs.pos_z run data get entity @s Pos[2] 100

tag @e[type=minecraft:mule,tag=big_beak.setup] add big_beak
tag @e[type=minecraft:mule,tag=big_beak.setup] remove big_beak.setup

tag @e[type=minecraft:item_display,tag=big_beak.model_setup] add big_beak.model
tag @e[type=minecraft:item_display,tag=big_beak.model_setup] remove big_beak.model_setup