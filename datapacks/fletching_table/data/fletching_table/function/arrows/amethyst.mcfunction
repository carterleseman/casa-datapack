# an amethyst arrow shoots with more speed.
# scale the motion up on spawn

execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"amethyst"}}}},tag=!fletching_table.arrow_amethyst] store result entity @s Motion[0] double 0.0000125 run data get entity @s Motion[0] 100000
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"amethyst"}}}},tag=!fletching_table.arrow_amethyst] store result entity @s Motion[1] double 0.0000125 run data get entity @s Motion[1] 100000
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"amethyst"}}}},tag=!fletching_table.arrow_amethyst] store result entity @s Motion[2] double 0.0000125 run data get entity @s Motion[2] 100000
tag @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"amethyst"}}}},tag=!fletching_table.arrow_amethyst] add fletching_table.arrow_amethyst
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"amethyst"}}}}] run data modify entity @s SoundEvent set value "minecraft:block.amethyst_cluster.hit"

execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"amethyst"}}},inGround:false}] at @s run playsound minecraft:block.amethyst_block.chime block @a
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"amethyst"}}},inGround:false}] at @s run particle minecraft:wax_off ~ ~ ~