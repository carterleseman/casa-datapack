# during the day, mimic an ocelot unless the meerkat is trying to hide
execute if predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } unless entity @s[tag=biome_vote.meerkat.hide] run function biome_vote:ai/mimic with entity @s data
# during the night or when hiding, navigate to the home burrow
execute unless predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } if block ~ ~1 ~ #biome_vote:meerkat_can_resurface if block ~ ~2 ~ #biome_vote:meerkat_can_resurface run function biome_vote:ai/pathfind with entity @s data
execute if predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } if entity @s[tag=biome_vote.meerkat.hide] run function biome_vote:ai/pathfind with entity @s data
# if its underground during the night, mimic
execute unless predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } unless block ~ ~1 ~ #biome_vote:meerkat_can_resurface run function biome_vote:ai/mimic with entity @s data
execute unless predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } unless block ~ ~2 ~ #biome_vote:meerkat_can_resurface run function biome_vote:ai/mimic with entity @s data

# if its night time and we found the entrance suspicious sand, burrow into it
# we only try to burrow if we're not under a block, otherwise we can hang out underground
execute if score @s biome_vote.meerkat.burrow_cooldown matches 60.. unless predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } if block ~ ~1 ~ #biome_vote:meerkat_can_resurface positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:suspicious_sand{} run return run function biome_vote:desert/meerkat/burrow { reason: "night" }
execute if score @s biome_vote.meerkat.burrow_cooldown matches 60.. unless predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } if block ~ ~1 ~ #biome_vote:meerkat_can_resurface positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:suspicious_sand{} run return run function biome_vote:desert/meerkat/burrow { reason: "night" }
execute if score @s biome_vote.meerkat.burrow_cooldown matches 60.. unless predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } if block ~ ~1 ~ #biome_vote:meerkat_can_resurface positioned ~1 ~ ~ if block ~ ~ ~ minecraft:suspicious_sand{} run return run function biome_vote:desert/meerkat/burrow { reason: "night" }
execute if score @s biome_vote.meerkat.burrow_cooldown matches 60.. unless predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } if block ~ ~1 ~ #biome_vote:meerkat_can_resurface positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:suspicious_sand{} run return run function biome_vote:desert/meerkat/burrow { reason: "night" }
execute if score @s biome_vote.meerkat.burrow_cooldown matches 60.. unless predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } if block ~ ~1 ~ #biome_vote:meerkat_can_resurface positioned ~ ~ ~1 if block ~ ~ ~ minecraft:suspicious_sand{} run return run function biome_vote:desert/meerkat/burrow { reason: "night" }

# if its day time and we are next to a suspicious sand block underground, try to resurface
execute if score @s biome_vote.meerkat.burrow_cooldown matches 60.. if predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } if predicate { condition: "minecraft:random_chance", chance: 0.05 } positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:suspicious_sand{} run return run function biome_vote:desert/meerkat/burrow { reason: "night" }
execute if score @s biome_vote.meerkat.burrow_cooldown matches 60.. if predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } if predicate { condition: "minecraft:random_chance", chance: 0.05 } positioned ~1 ~ ~ if block ~ ~ ~ minecraft:suspicious_sand{} run return run function biome_vote:desert/meerkat/burrow { reason: "night" }
execute if score @s biome_vote.meerkat.burrow_cooldown matches 60.. if predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } if predicate { condition: "minecraft:random_chance", chance: 0.05 } positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:suspicious_sand{} run return run function biome_vote:desert/meerkat/burrow { reason: "night" }
execute if score @s biome_vote.meerkat.burrow_cooldown matches 60.. if predicate { condition: "minecraft:time_check", value: { min: 1000, max: 13000 } } if predicate { condition: "minecraft:random_chance", chance: 0.05 } positioned ~ ~ ~1 if block ~ ~ ~ minecraft:suspicious_sand{} run return run function biome_vote:desert/meerkat/burrow { reason: "night" }

# check for nearby hostile entities
execute if entity @e[type=#biome_vote:hostile, distance=..10] run function biome_vote:desert/meerkat/hide

# if the meerkat is trying to hide and it has run away for at least 3 seconds, check for sand blocks to burrow into
execute if entity @s[tag=biome_vote.meerkat.hide] run scoreboard players add @s biome_vote.animation 1
execute if entity @s[tag=!biome_vote.meerkat.hide] run scoreboard players reset @s biome_vote.animation
execute if entity @s[tag=biome_vote.meerkat.hide] if score @s biome_vote.animation matches 60.. positioned ~ ~-1 ~ if block ~ ~ ~ #biome_vote:meerkat_can_burrow run function biome_vote:desert/meerkat/burrow { reason: "hiding" }
# if the meerkat is trying to hide and it hasn't found a sand block to hide in after 10 seconds, stop trying to hide
execute if entity @s[tag=biome_vote.meerkat.hide] if score @s biome_vote.animation matches 200.. run tag @s remove biome_vote.meerkat.hide

# only let the meerkat burrow if it has been alive for at least 3 seconds
# this prevents very quick burrow/resurface loops
scoreboard players add @s biome_vote.meerkat.burrow_cooldown 1