execute store result score #prev prehistoric_mobs.pos_x run scoreboard players get @s prehistoric_mobs.pos_x
execute store result score #prev prehistoric_mobs.pos_y run scoreboard players get @s prehistoric_mobs.pos_y
execute store result score #prev prehistoric_mobs.pos_z run scoreboard players get @s prehistoric_mobs.pos_z
execute store result score @s prehistoric_mobs.pos_x run data get entity @s Pos[0] 100
execute store result score @s prehistoric_mobs.pos_y run data get entity @s Pos[1] 100
execute store result score @s prehistoric_mobs.pos_z run data get entity @s Pos[2] 100

# vector
scoreboard players operation @s prehistoric_mobs.pos_x -= #prev prehistoric_mobs.pos_x
scoreboard players operation @s prehistoric_mobs.pos_y -= #prev prehistoric_mobs.pos_y
scoreboard players operation @s prehistoric_mobs.pos_z -= #prev prehistoric_mobs.pos_z

execute store result score #vector prehistoric_mobs.pos_x run scoreboard players get @s prehistoric_mobs.pos_x
execute store result score #vector prehistoric_mobs.pos_y run scoreboard players get @s prehistoric_mobs.pos_y
execute store result score #vector prehistoric_mobs.pos_z run scoreboard players get @s prehistoric_mobs.pos_z

# magnitude
scoreboard players operation @s prehistoric_mobs.pos_x *= @s prehistoric_mobs.pos_x
scoreboard players operation @s prehistoric_mobs.pos_y *= @s prehistoric_mobs.pos_y
scoreboard players operation @s prehistoric_mobs.pos_z *= @s prehistoric_mobs.pos_z

scoreboard players operation @s prehistoric_mobs.pos_x += @s prehistoric_mobs.pos_y
scoreboard players operation @s prehistoric_mobs.pos_x += @s prehistoric_mobs.pos_z

execute store result score #result prehistoric_mobs.pos_x run scoreboard players get @s prehistoric_mobs.pos_x

# setup for next check
execute store result score @s prehistoric_mobs.pos_x run data get entity @s Pos[0] 100
execute store result score @s prehistoric_mobs.pos_y run data get entity @s Pos[1] 100
execute store result score @s prehistoric_mobs.pos_z run data get entity @s Pos[2] 100

return run scoreboard players get #result prehistoric_mobs.pos_x