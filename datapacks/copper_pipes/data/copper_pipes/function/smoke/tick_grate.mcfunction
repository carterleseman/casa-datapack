# execute unless score @s copper_pipes.smoke matches 0 unless score @s copper_pipes.water matches 0 unless block ~ ~-1 ~ #minecraft:campfires run scoreboard players remove @s copper_pipes.smoke 1

# campfires add to smoke level
execute unless score @s copper_pipes.smoke matches 16 if block ~ ~-1 ~ #minecraft:campfires[lit=true] run scoreboard players add @s copper_pipes.smoke 1
# random smoke decay
execute unless score @s copper_pipes.smoke matches 0 unless block ~ ~-1 ~ #minecraft:campfires[lit=true] if predicate { "condition": "minecraft:random_chance", "chance": 0.075 } run scoreboard players remove @s copper_pipes.smoke 1

# move smoke to connected blocks
execute positioned ~ ~1 ~ if score @s copper_pipes.smoke > @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.smoke run function copper_pipes:smoke/transfer_smoke
execute positioned ~ ~-1 ~ if score @s copper_pipes.smoke > @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.smoke run function copper_pipes:smoke/transfer_smoke
execute positioned ~-1 ~ ~ if score @s copper_pipes.smoke > @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.smoke run function copper_pipes:smoke/transfer_smoke
execute positioned ~1 ~ ~ if score @s copper_pipes.smoke > @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.smoke run function copper_pipes:smoke/transfer_smoke
execute positioned ~ ~ ~-1 if score @s copper_pipes.smoke > @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.smoke run function copper_pipes:smoke/transfer_smoke
execute positioned ~ ~ ~1 if score @s copper_pipes.smoke > @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.smoke run function copper_pipes:smoke/transfer_smoke