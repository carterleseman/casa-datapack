scoreboard players set @e[type=minecraft:item_display,tag=copper_pipes.grate] copper_pipes.zero 0
scoreboard players set @e[type=minecraft:item_display,tag=copper_pipes.grate] copper_pipes.one 1

execute as @e[type=minecraft:item_display,tag=copper_pipes.grate] at @s run function copper_pipes:water/update_level

execute as @e[type=minecraft:item_display,tag=copper_pipes.grate] at @s run function copper_pipes:water/update_display

execute as @e[type=minecraft:item_display,tag=copper_pipes.grate] at @s run function copper_pipes:water/update_bubble_columns

execute as @e[type=minecraft:item_display,tag=copper_pipes.grate] unless score @s copper_pipes.level_changed matches 0 at @s run playsound block.water.ambient block @a ~ ~ ~ 0.25

# water only updates every 5 ticks
schedule function copper_pipes:water/tick 5t replace