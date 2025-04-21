data modify entity @s transformation.scale set value [0.99f, 0.99f, 0.99f]

execute if score @s copper_pipes.water matches 8 if score @s copper_pipes.bubble_column_up matches 1 run return run data modify entity @s item set value {id:"minecraft:water_bucket", components:{"minecraft:item_model": "copper_pipes:bubble_column_up"} }
execute if score @s copper_pipes.water matches 8 if score @s copper_pipes.bubble_column_down matches 1 run return run data modify entity @s item set value {id:"minecraft:water_bucket", components:{"minecraft:item_model": "copper_pipes:bubble_column_down"} }
execute if score @s copper_pipes.water matches 8 run return run data modify entity @s item set value {id:"minecraft:water_bucket", components:{"minecraft:item_model": "copper_pipes:water_8"} }
execute if score @s copper_pipes.water matches 7 run return run data modify entity @s item set value {id:"minecraft:water_bucket", components:{"minecraft:item_model": "copper_pipes:water_7"} }
execute if score @s copper_pipes.water matches 6 run return run data modify entity @s item set value {id:"minecraft:water_bucket", components:{"minecraft:item_model": "copper_pipes:water_6"} }
execute if score @s copper_pipes.water matches 5 run return run data modify entity @s item set value {id:"minecraft:water_bucket", components:{"minecraft:item_model": "copper_pipes:water_5"} }
execute if score @s copper_pipes.water matches 4 run return run data modify entity @s item set value {id:"minecraft:water_bucket", components:{"minecraft:item_model": "copper_pipes:water_4"} }
execute if score @s copper_pipes.water matches 3 run return run data modify entity @s item set value {id:"minecraft:water_bucket", components:{"minecraft:item_model": "copper_pipes:water_3"} }
execute if score @s copper_pipes.water matches 2 run return run data modify entity @s item set value {id:"minecraft:water_bucket", components:{"minecraft:item_model": "copper_pipes:water_2"} }
execute if score @s copper_pipes.water matches 1 run return run data modify entity @s item set value {id:"minecraft:water_bucket", components:{"minecraft:item_model": "copper_pipes:water_1"} }

data modify entity @s transformation.scale set value [0f, 0f, 0f]