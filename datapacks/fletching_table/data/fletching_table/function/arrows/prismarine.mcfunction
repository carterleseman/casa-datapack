# this arrow can fly through water like in the air.
# in the water, the game multiplies the velocity by 0.6 to simulate drag.
# in the air, its multiplied by 0.99.
# we need to scale the velocity back up to remove the drag.

execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"prismarine"}}}}] at @s run particle minecraft:dolphin ~ ~ ~ 0.05 0.05 0.05 0 1

execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"prismarine"}}},inGround:false}] at @s if block ~ ~ ~ minecraft:water store result entity @s Motion[0] double 0.0014 run data get entity @s Motion[0] 1000
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"prismarine"}}},inGround:false}] at @s if block ~ ~ ~ minecraft:water store result entity @s Motion[1] double 0.0014 run data get entity @s Motion[1] 1000
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"prismarine"}}},inGround:false}] at @s if block ~ ~ ~ minecraft:water store result entity @s Motion[2] double 0.0014 run data get entity @s Motion[2] 1000