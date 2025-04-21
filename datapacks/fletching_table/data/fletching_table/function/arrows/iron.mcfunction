# this arrow is heavier, so it will always crit but is slower

# decay motion to slow the arrow
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"iron"}}},inGround:false}] store result entity @s Motion[0] double 0.00095 run data get entity @s Motion[0] 1000
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"iron"}}},inGround:false}] store result entity @s Motion[1] double 0.00095 run data get entity @s Motion[1] 1000
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"iron"}}},inGround:false}] store result entity @s Motion[2] double 0.00095 run data get entity @s Motion[2] 1000

# arrow stats
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"iron"}}}}] run data modify entity @s crit set value true
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"iron"}}}}] run data modify entity @s damage set value 3.0
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"iron"}}}}] run data modify entity @s SoundEvent set value "minecraft:item.trident.hit_ground"