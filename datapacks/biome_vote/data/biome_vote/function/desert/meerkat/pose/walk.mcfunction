# step sound
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.body, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 0 at @s run playsound minecraft:block.suspicious_sand.step ambient @a ~ ~ ~ 0.05
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.body, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 5 at @s run playsound minecraft:block.suspicious_sand.step ambient @a ~ ~ ~ 0.05

execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.body, tag=!biome_vote.ai.idle] rotated as @s run rotate @s ~ 90
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.body, tag=!biome_vote.ai.idle] at @s rotated as @s run tp @s ^ ^-.75 ^-.3125 ~ ~

execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.head, tag=!biome_vote.ai.idle] at @s rotated as @s run data modify entity @s transformation.translation set value [0d, 0d, 0d]
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.head, tag=!biome_vote.ai.idle] at @s rotated as @s run tp @s ^ ^.3125 ^0.125 ~ ~

execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_left, tag=!biome_vote.ai.idle] rotated as @s run rotate @s ~ 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_left, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 0 run data modify entity @s transformation.left_rotation set value [0.3d, 0d, 0d, 1d]
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_left, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 5 run data modify entity @s transformation.left_rotation set value [-0.3d, 0d, 0d, 1d]
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_left, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 0 run data modify entity @s start_interpolation set value 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_left, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 5 run data modify entity @s start_interpolation set value 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_left, tag=!biome_vote.ai.idle] at @s rotated as @s run tp @s ^ ^ ^-.625

execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_right, tag=!biome_vote.ai.idle] rotated as @s run rotate @s ~ 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_right, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 0 run data modify entity @s transformation.left_rotation set value [-0.3d, 0d, 0d, 1d]
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_right, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 5 run data modify entity @s transformation.left_rotation set value [0.3d, 0d, 0d, 1d]
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_right, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 0 run data modify entity @s start_interpolation set value 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_right, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 5 run data modify entity @s start_interpolation set value 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.leg_right, tag=!biome_vote.ai.idle] at @s rotated as @s run tp @s ^ ^ ^-.625

execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_left, tag=!biome_vote.ai.idle] rotated as @s run rotate @s ~ 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_left, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 0 run data modify entity @s transformation.left_rotation set value [-0.2d, 0d, 0d, 1d]
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_left, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 5 run data modify entity @s transformation.left_rotation set value [0.2d, 0d, 0d, 1d]
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_left, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 0 run data modify entity @s start_interpolation set value 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_left, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 5 run data modify entity @s start_interpolation set value 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_left, tag=!biome_vote.ai.idle] at @s rotated as @s run tp @s ^ ^ ^-.125

execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_right, tag=!biome_vote.ai.idle] rotated as @s run rotate @s ~ 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_right, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 0 run data modify entity @s transformation.left_rotation set value [0.2d, 0d, 0d, 1d]
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_right, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 5 run data modify entity @s transformation.left_rotation set value [-0.2d, 0d, 0d, 1d]
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_right, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 0 run data modify entity @s start_interpolation set value 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_right, tag=!biome_vote.ai.idle] if score @s biome_vote.animation matches 5 run data modify entity @s start_interpolation set value 0
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.arm_right, tag=!biome_vote.ai.idle] at @s rotated as @s run tp @s ^ ^ ^-.125

scoreboard players add @e[type=minecraft:item_display, tag=biome_vote.ai.model] biome_vote.animation 1
scoreboard players set @e[type=minecraft:item_display, tag=biome_vote.ai.model, scores={ biome_vote.animation=10 }] biome_vote.animation 0