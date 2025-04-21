execute if score @s copper_pipes.water matches 0 run scoreboard players set @s copper_pipes.bubble_column_up 0
execute if score @s copper_pipes.water matches 0 run return run scoreboard players set @s copper_pipes.bubble_column_down 0

execute if block ~ ~-1 ~ #copper_pipes:bubble_column_up run return run function copper_pipes:water/set_bubble_column { objective: "copper_pipes.bubble_column_up", sound: "upwards" }
execute if block ~ ~-1 ~ minecraft:magma_block run return run function copper_pipes:water/set_bubble_column { objective: "copper_pipes.bubble_column_down", sound: "whirlpool" }

execute positioned ~ ~-1 ~ if score @n[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01] copper_pipes.bubble_column_up matches 1 run return run function copper_pipes:water/set_bubble_column { objective: "copper_pipes.bubble_column_up", sound: "upwards" }
execute positioned ~ ~-1 ~ if score @n[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01] copper_pipes.bubble_column_down matches 1 run return run function copper_pipes:water/set_bubble_column { objective: "copper_pipes.bubble_column_down", sound: "whirlpool" }

scoreboard players set @s copper_pipes.bubble_column_up 0
scoreboard players set @s copper_pipes.bubble_column_down 0