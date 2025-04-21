execute unless block ~ ~ ~ minecraft:suspicious_sand positioned ~ ~1 ~ run return run function biome_vote:desert/meerkat/resurface

# move down further if there's more suspicious sand (like a generated burrow)
# go underground if we're trying to hide or its night
execute if entity @s[tag=biome_vote.meerkat.underground_hiding] if score @s biome_vote.animation matches 10 positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:suspicious_sand run return run function biome_vote:desert/meerkat/traverse_underground
execute if entity @s[tag=biome_vote.meerkat.underground_night] unless predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } if score @s biome_vote.animation matches 10 positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:suspicious_sand run return run function biome_vote:desert/meerkat/traverse_underground
# go above ground if its daytime
execute if entity @s[tag=biome_vote.meerkat.underground_night] if predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } if score @s biome_vote.animation matches 10 positioned ~ ~1 ~ if block ~ ~ ~ minecraft:suspicious_sand run return run function biome_vote:desert/meerkat/traverse_underground

# randomly pick a direction to move in
execute if entity @s[tag=biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 10 if predicate { condition: "minecraft:random_chance", chance: 0.5 } positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:suspicious_sand run return run function biome_vote:desert/meerkat/traverse_underground
execute if entity @s[tag=biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 10 if predicate { condition: "minecraft:random_chance", chance: 0.5 } positioned ~1 ~ ~ if block ~ ~ ~ minecraft:suspicious_sand run return run function biome_vote:desert/meerkat/traverse_underground
execute if entity @s[tag=biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 10 if predicate { condition: "minecraft:random_chance", chance: 0.5 } positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:suspicious_sand run return run function biome_vote:desert/meerkat/traverse_underground
execute if entity @s[tag=biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 10 if predicate { condition: "minecraft:random_chance", chance: 0.5 } positioned ~ ~ ~1 if block ~ ~ ~ minecraft:suspicious_sand run return run function biome_vote:desert/meerkat/traverse_underground

# try to pop out in the same direction the suspicious sand had us traveling before
execute if entity @s[tag=biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 10 if block ~ ~1 ~ #biome_vote:meerkat_can_resurface if block ~ ~-1 ~ minecraft:suspicious_sand positioned ~ ~1 ~ run return run function biome_vote:desert/meerkat/resurface
execute if entity @s[tag=biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 10 if block ~ ~ ~1 #biome_vote:meerkat_can_resurface if block ~ ~ ~-1 minecraft:suspicious_sand positioned ~ ~ ~1 run return run function biome_vote:desert/meerkat/resurface
execute if entity @s[tag=biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 10 if block ~ ~ ~-1 #biome_vote:meerkat_can_resurface if block ~ ~ ~1 minecraft:suspicious_sand positioned ~ ~ ~-1 run return run function biome_vote:desert/meerkat/resurface
execute if entity @s[tag=biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 10 if block ~1 ~ ~ #biome_vote:meerkat_can_resurface if block ~-1 ~ ~ minecraft:suspicious_sand positioned ~1 ~ ~ run return run function biome_vote:desert/meerkat/resurface
execute if entity @s[tag=biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 10 if block ~-1 ~ ~ #biome_vote:meerkat_can_resurface if block ~1 ~ ~ minecraft:suspicious_sand positioned ~-1 ~ ~ run return run function biome_vote:desert/meerkat/resurface

# try to pop out in any direction that is clear
execute if entity @s[tag=biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 10 positioned ~ ~1 ~ if block ~ ~ ~ #biome_vote:meerkat_can_resurface run return run function biome_vote:desert/meerkat/resurface
execute if entity @s[tag=biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 10 positioned ~ ~ ~1 if block ~ ~ ~ #biome_vote:meerkat_can_resurface run return run function biome_vote:desert/meerkat/resurface
execute if entity @s[tag=biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 10 positioned ~ ~ ~-1 if block ~ ~ ~ #biome_vote:meerkat_can_resurface run return run function biome_vote:desert/meerkat/resurface
execute if entity @s[tag=biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 10 positioned ~1 ~ ~ if block ~ ~ ~ #biome_vote:meerkat_can_resurface run return run function biome_vote:desert/meerkat/resurface
execute if entity @s[tag=biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 10 positioned ~-1 ~ ~ if block ~ ~ ~ #biome_vote:meerkat_can_resurface run return run function biome_vote:desert/meerkat/resurface

# peek after 10 seconds
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 200 run setblock ~ ~ ~ minecraft:suspicious_sand[dusted=3]
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 200 run playsound minecraft:block.sand.hit neutral @a ~ ~ ~ 1 1
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 200 run data modify entity @s transformation.scale set value [1d, 1d, 1d]
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 200 on passengers run data modify entity @s transformation.scale set value [1d, 1d, 1d]

execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 200 run data modify entity @s interpolation_duration set value 2
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 200 run data modify entity @s start_interpolation set value -1
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 200 run data modify entity @s transformation.translation set value [0d, 0d, 0d]
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 200 on passengers run data modify entity @s interpolation_duration set value 2
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 200 on passengers run data modify entity @s start_interpolation set value -1
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 200 on passengers run data modify entity @s transformation.translation set value [0d, 0d, 0d]

# look left and right for danger
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 220 on passengers run data modify entity @s start_interpolation set value -1
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 220 on passengers run data modify entity @s transformation.left_rotation[1] set value 0.5f
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 240 on passengers run data modify entity @s start_interpolation set value -1
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 240 on passengers run data modify entity @s transformation.left_rotation[1] set value -0.5f
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 262 on passengers run data modify entity @s transformation.left_rotation[1] set value 0f

# after peeking for 1 second, decide to stay burrowed or come back out
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 260 run playsound minecraft:block.sand.hit neutral @a ~ ~ ~ 1 1
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 260 if entity @e[type=#biome_vote:hostile, distance=..10] run setblock ~ ~ ~ minecraft:suspicious_sand[dusted=1]
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 260 if entity @e[type=#biome_vote:hostile, distance=..10] run data modify entity @s transformation.scale set value [0d, 0d, 0d]
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 260 run data modify entity @s interpolation_duration set value 2
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 260 run data modify entity @s start_interpolation set value -1
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 260 run data modify entity @s transformation.translation set value [0d, -0.5d, 0d]
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 260 on passengers run data modify entity @s interpolation_duration set value 2
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 260 on passengers run data modify entity @s start_interpolation set value -1
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 260 on passengers run data modify entity @s transformation.translation set value [0d, -0.5d, 0d]
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 262 if entity @e[type=#biome_vote:hostile, distance=..10] on passengers run data modify entity @s transformation.scale set value [0d, 0d, 0d]

execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 260 unless entity @e[type=#biome_vote:hostile, distance=..10] if block ~ ~1 ~ #biome_vote:meerkat_can_resurface run setblock ~ ~ ~ minecraft:suspicious_sand[dusted=0]
execute if entity @s[tag=!biome_vote.meerkat.underground_night] if score @s biome_vote.animation matches 260 unless entity @e[type=#biome_vote:hostile, distance=..10] positioned ~ ~1 ~ if block ~ ~ ~ #biome_vote:meerkat_can_resurface run function biome_vote:desert/meerkat/resurface

execute if score @s biome_vote.animation matches 262.. run scoreboard players set @s biome_vote.animation 0
scoreboard players add @s biome_vote.animation 1