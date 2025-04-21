execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.body, tag=biome_vote.ai.idle] at @s if predicate { condition: "minecraft:random_chance", chance: 0.01 } run playsound minecraft:entity.axolotl.idle_air neutral @a ~ ~ ~ 0.5 0.5

execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.body, tag=biome_vote.ai.idle] rotated as @s run rotate @s ~ 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.body, tag=biome_vote.ai.idle] at @s rotated as @s run tp @s ~ ~.25 ~

execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.head, tag=biome_vote.ai.idle] at @s rotated as @s run data modify entity @s transformation.translation set value [0d, 0d, 0d]
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.head, tag=biome_vote.ai.idle] at @s rotated as @s run tp @s ~ ~.9375 ~

execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_left, tag=biome_vote.ai.idle] rotated as @s run rotate @s ~ 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_left, tag=biome_vote.ai.idle] at @s rotated as @s run tp @s ~ ~ ~
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_left, tag=biome_vote.ai.idle] run data modify entity @s transformation.left_rotation set value [0d, 0d, 0d, 1d]

execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_right, tag=biome_vote.ai.idle] rotated as @s run rotate @s ~ 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_right, tag=biome_vote.ai.idle] at @s rotated as @s run tp @s ~ ~ ~
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_right, tag=biome_vote.ai.idle] run data modify entity @s transformation.left_rotation set value [0d, 0d, 0d, 1d]

execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_left, tag=biome_vote.ai.idle] rotated as @s run rotate @s ~ 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_left, tag=biome_vote.ai.idle] at @s rotated as @s run tp @s ~ ~.4375 ~
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_left, tag=biome_vote.ai.idle] run data modify entity @s transformation.left_rotation set value [-0.2d, 0d, 0d, 1d]

execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_right, tag=biome_vote.ai.idle] rotated as @s run rotate @s ~ 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_right, tag=biome_vote.ai.idle] at @s rotated as @s run tp @s ~ ~.4375 ~
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_right, tag=biome_vote.ai.idle] run data modify entity @s transformation.left_rotation set value [-0.2d, 0d, 0d, 1d]