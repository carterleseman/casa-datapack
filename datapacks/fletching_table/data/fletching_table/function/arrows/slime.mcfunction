# this arrow will bounce when it hits the ground, slowly losing speed
# if it hits a target block, it will stop completely

# arrow stats
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}}}] run data modify entity @s PierceLevel set value 16b
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}}}] run data modify entity @s damage set value 1.0d
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}}}] run data modify entity @s SoundEvent set value "minecraft:entity.slime.jump"

# particles
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}},inGround:false}] at @s run particle minecraft:item_slime ~ ~ ~ 0 0 0 0 1
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}}}] at @s run particle minecraft:item{item:{id:"minecraft:slime_block"}} ^ ^ ^ 0.1 0 0.1 0 1

# store the motion before it hits
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}},inGround:false}] store result score @s fletching_table.slime_arrow_vx run data get entity @s Motion[0] 100
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}},inGround:false}] store result score @s fletching_table.slime_arrow_vy run data get entity @s Motion[1] 100
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}},inGround:false}] store result score @s fletching_table.slime_arrow_vz run data get entity @s Motion[2] 100

# bounce the arrow (flip the motion when it hits)
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}},inGround:true}] store result entity @s Motion[0] double 0.01 run scoreboard players get @s fletching_table.slime_arrow_vx
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}},inGround:true}] store result entity @s Motion[2] double 0.01 run scoreboard players get @s fletching_table.slime_arrow_vz

execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}},inGround:true}] at @s unless block ~1 ~ ~ #minecraft:replaceable store result entity @s Motion[0] double -0.005 run scoreboard players get @s fletching_table.slime_arrow_vx
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}},inGround:true}] at @s unless block ~-1 ~ ~ #minecraft:replaceable store result entity @s Motion[0] double -0.005 run scoreboard players get @s fletching_table.slime_arrow_vx
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}},inGround:true}] at @s unless block ~ ~1 ~ #minecraft:replaceable store result entity @s Motion[1] double -0.005 run scoreboard players get @s fletching_table.slime_arrow_vy
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}},inGround:true}] at @s unless block ~ ~-1 ~ #minecraft:replaceable store result entity @s Motion[1] double -0.005 run scoreboard players get @s fletching_table.slime_arrow_vy
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}},inGround:true}] at @s unless block ~ ~ ~1 #minecraft:replaceable store result entity @s Motion[2] double -0.005 run scoreboard players get @s fletching_table.slime_arrow_vz
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}},inGround:true}] at @s unless block ~ ~ ~-1 #minecraft:replaceable store result entity @s Motion[2] double -0.005 run scoreboard players get @s fletching_table.slime_arrow_vz

# set inGround to false so it can keep moving, unless it hits a target block.
# execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}},inGround:true}] unless entity @s[nbt={inBlockState:{Name:"minecraft:target"}}] unless score @s fletching_table.slime_arrow_vy matches -13..-10 at @s run playsound minecraft:entity.slime.jump_small block @a ~ ~ ~ 1
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"slime"}}},inGround:true}] unless entity @s[nbt={inBlockState:{Name:"minecraft:target"}}] unless score @s fletching_table.slime_arrow_vy matches -13..-10 run data modify entity @s inGround set value false