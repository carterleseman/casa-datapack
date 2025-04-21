# this arrow will leave a light trail in its path
# it is weak as a weapon

# arrow stats
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"torch"}}}}] run data modify entity @s damage set value 0.1d

# particles
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"torch"}}}}] at @s run particle minecraft:end_rod ~ ~ ~ 0 0 0 0 1

execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"torch"}}}}] at @s if block ~ ~ ~ #minecraft:air unless entity @e[type=minecraft:marker,distance=..3,tag=fletching_table.arrow_torch] run summon minecraft:marker ~ ~ ~ { Tags:["fletching_table.arrow_torch_setup"] }
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"torch"}}}}] at @s if block ~ ~ ~ minecraft:water[level=0] unless entity @e[type=minecraft:marker,distance=..3,tag=fletching_table.arrow_torch] run summon minecraft:marker ~ ~ ~ { Tags:["fletching_table.arrow_torch_setup"] }

# setup light area effects
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_torch_setup] run scoreboard players set @s fletching_table.torch_arrow_decay 30
tag @e[type=minecraft:marker,tag=fletching_table.arrow_torch_setup] add fletching_table.arrow_torch
tag @e[type=minecraft:marker,tag=fletching_table.arrow_torch_setup] remove fletching_table.arrow_torch_setup

# decay light level
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_torch] at @s unless entity @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"torch"}}},inGround:true},distance=..4] store result entity @s data.level int 0.5 run scoreboard players remove @s fletching_table.torch_arrow_decay 1
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_torch] at @s if entity @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"torch"}}},inGround:true},distance=..4] store result entity @s data.level int 0.5 run scoreboard players set @s fletching_table.torch_arrow_decay 30
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_torch] at @s if entity @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"torch"}}},inGround:true},distance=..4] if block ~ ~ ~ minecraft:light[waterlogged=false] unless block ~ ~ ~ minecraft:light[level=15] run function fletching_table:arrows/torch_light
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_torch] at @s if entity @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"torch"}}},inGround:true},distance=..4] if block ~ ~ ~ minecraft:light[waterlogged=true] unless block ~ ~ ~ minecraft:light[level=15] run function fletching_table:arrows/torch_light_waterlogged
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_torch] at @s unless entity @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"torch"}}},inGround:true},distance=..4] if block ~ ~ ~ minecraft:light[waterlogged=false] run function fletching_table:arrows/torch_light with entity @s data
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_torch] at @s unless entity @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"torch"}}},inGround:true},distance=..4] if block ~ ~ ~ minecraft:light[waterlogged=true] run function fletching_table:arrows/torch_light_waterlogged with entity @s data
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_torch] at @s if block ~ ~ ~ #minecraft:air run function fletching_table:arrows/torch_light with entity @s data
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_torch] at @s if block ~ ~ ~ minecraft:water[level=0] run function fletching_table:arrows/torch_light_waterlogged with entity @s data
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_torch] at @s if score @s fletching_table.torch_arrow_decay matches ..0 if block ~ ~ ~ minecraft:light[waterlogged=false] run setblock ~ ~ ~ minecraft:air
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_torch] at @s if score @s fletching_table.torch_arrow_decay matches ..0 if block ~ ~ ~ minecraft:light[waterlogged=true] run setblock ~ ~ ~ minecraft:water
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_torch] if score @s fletching_table.torch_arrow_decay matches ..0 run kill @s