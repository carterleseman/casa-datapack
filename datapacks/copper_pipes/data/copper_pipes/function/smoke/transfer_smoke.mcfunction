execute if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.smoke matches 16 run return fail
scoreboard players remove @s copper_pipes.smoke 1
scoreboard players add @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.smoke 1