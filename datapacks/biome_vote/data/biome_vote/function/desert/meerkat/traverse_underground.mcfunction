execute unless block ~ ~ ~ minecraft:suspicious_sand{} run return fail
setblock ~ ~ ~ minecraft:suspicious_sand[dusted=1]
particle minecraft:block{block_state:"minecraft:sand"} ~ ~ ~ 0.5 0.5 0.5 0.1 30
playsound minecraft:block.sand.hit neutral @a ~ ~ ~ 1 1
tp @s ~ ~ ~
scoreboard players reset @s biome_vote.animation