execute as @e[type=minecraft:item_display,tag=copper_pipes.grate] unless score @s copper_pipes.water matches 0 if predicate { "condition": "minecraft:random_chance", "chance": 0.1 } at @s run playsound block.water.ambient block @a ~ ~ ~ 0.05

schedule function copper_pipes:water/ambience_tick 2.5s replace