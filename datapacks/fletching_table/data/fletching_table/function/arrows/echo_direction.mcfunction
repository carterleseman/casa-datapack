playsound minecraft:block.beacon.ambient neutral @a ~ ~ ~ 1 2

# only track target after flying for 10 ticks, and stop tracking after 64
execute unless score @s fletching_table.echo_arrow_lifetime matches 10..64 run return fail

# fx
# particle minecraft:sculk_charge{roll:0} ~ ~ ~
particle minecraft:sculk_charge_pop ~ ~ ~

# find the target
tag @e[tag=fletching_table.arrow_echo.possible_target] remove fletching_table.arrow_echo.possible_target
tag @e[tag=fletching_table.arrow_echo.target_entity] remove fletching_table.arrow_echo.target_entity
execute at @e[distance=..100, type=!minecraft:block_display, type=!minecraft:item_display, type=!minecraft:marker, type=!minecraft:item, type=!minecraft:interaction, type=!minecraft:area_effect_cloud, type=!minecraft:arrow, type=!minecraft:experience_orb] run function fletching_table:arrows/echo_target with entity @s

# prefer to target players
tag @n[type=minecraft:player, tag=fletching_table.arrow_echo.possible_target] add fletching_table.arrow_echo.target_entity
# otherwise, tag the nearest mob
execute unless entity @e[tag=fletching_table.arrow_echo.target_entity] run tag @n[tag=fletching_table.arrow_echo.possible_target] add fletching_table.arrow_echo.target_entity

execute at @e[tag=fletching_table.arrow_echo.target_entity] run particle minecraft:sculk_soul ~ ~ ~ 0.5 0.5 0.5 0 1

# calculate movement vector toward target with marker entity
execute facing entity @n[tag=fletching_table.arrow_echo.target_entity] eyes positioned ~ ~ ~ run summon minecraft:marker ^ ^ ^1 {Tags:["fletching_table.arrow_echo.target"]}
rotate @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] facing entity @n[tag=fletching_table.arrow_echo.target_entity] eyes

# if we're inside a block, move in a cardinal direction that is open instead
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] at @s unless block ~ ~ ~ #minecraft:replaceable positioned ^ ^ ^-1 if block ~-1 ~ ~ #minecraft:replaceable run tp @s ~-1 ~ ~
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] at @s unless block ~ ~ ~ #minecraft:replaceable positioned ^ ^ ^-1 if block ~1 ~ ~ #minecraft:replaceable run tp @s ~1 ~ ~
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] at @s unless block ~ ~ ~ #minecraft:replaceable positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:replaceable run tp @s ~ ~-1 ~
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] at @s unless block ~ ~ ~ #minecraft:replaceable positioned ^ ^ ^-1 if block ~ ~1 ~ #minecraft:replaceable run tp @s ~ ~1 ~
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] at @s unless block ~ ~ ~ #minecraft:replaceable positioned ^ ^ ^-1 if block ~ ~ ~-1 #minecraft:replaceable run tp @s ~ ~ ~-1
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] at @s unless block ~ ~ ~ #minecraft:replaceable positioned ^ ^ ^-1 if block ~ ~ ~1 #minecraft:replaceable run tp @s ~ ~ ~1

# movement vector math
execute store result score @s fletching_table.echo_arrow_x run data get entity @s Pos[0] 100
execute store result score @s fletching_table.echo_arrow_y run data get entity @s Pos[1] 100
execute store result score @s fletching_table.echo_arrow_z run data get entity @s Pos[2] 100

execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] store result score @s fletching_table.echo_arrow_x run data get entity @s Pos[0] 100
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] store result score @s fletching_table.echo_arrow_y run data get entity @s Pos[1] 100
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] store result score @s fletching_table.echo_arrow_z run data get entity @s Pos[2] 100

scoreboard players operation @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_x -= @s fletching_table.echo_arrow_x
scoreboard players operation @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_y -= @s fletching_table.echo_arrow_y
scoreboard players operation @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_z -= @s fletching_table.echo_arrow_z

scoreboard players set #-1 fletching_table.echo_arrow_x_abs -1
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] store result score @s fletching_table.echo_arrow_x_abs run scoreboard players get @s fletching_table.echo_arrow_x
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] store result score @s fletching_table.echo_arrow_y_abs run scoreboard players get @s fletching_table.echo_arrow_y
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] store result score @s fletching_table.echo_arrow_z_abs run scoreboard players get @s fletching_table.echo_arrow_z
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] store result score @s fletching_table.echo_arrow_x_abs if score @s fletching_table.echo_arrow_x_abs matches ..0 run scoreboard players operation @s fletching_table.echo_arrow_x_abs *= #-1 fletching_table.echo_arrow_x_abs
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] store result score @s fletching_table.echo_arrow_y_abs if score @s fletching_table.echo_arrow_y_abs matches ..0 run scoreboard players operation @s fletching_table.echo_arrow_y_abs *= #-1 fletching_table.echo_arrow_x_abs
execute as @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target] store result score @s fletching_table.echo_arrow_z_abs if score @s fletching_table.echo_arrow_z_abs matches ..0 run scoreboard players operation @s fletching_table.echo_arrow_z_abs *= #-1 fletching_table.echo_arrow_x_abs

# apply movement vector on only 1 axis
data modify entity @s Motion[0] set value 0d
data modify entity @s Motion[1] set value 0d
# data modify entity @s Motion[2] set value 0d

# execute if score @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_x_abs > @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_y_abs if score @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_x_abs > @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_z_abs store result entity @s Motion[0] double 0.005 run scoreboard players get @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_x
# execute if score @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_y_abs > @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_x_abs if score @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_y_abs > @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_z_abs store result entity @s Motion[1] double 0.005 run scoreboard players get @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_y
# execute if score @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_z_abs > @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_x_abs if score @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_z_abs > @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_y_abs store result entity @s Motion[2] double 0.005 run scoreboard players get @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_z
execute if score @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_x_abs > @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_z_abs store result entity @s Motion[0] double 0.005 run scoreboard players get @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_x
execute if score @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_y matches 0.. store result entity @s Motion[1] double 0.005 run scoreboard players get @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_y
execute if score @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_y matches ..0 if score @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_x_abs matches ..25 if score @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_z_abs matches ..25 store result entity @s Motion[1] double 0.005 run scoreboard players get @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_y
execute if score @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_z_abs > @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_x_abs store result entity @s Motion[2] double 0.005 run scoreboard players get @n[type=minecraft:marker,tag=fletching_table.arrow_echo.target] fletching_table.echo_arrow_z

# cleanup marker entity
kill @e[type=minecraft:marker,tag=fletching_table.arrow_echo.target]