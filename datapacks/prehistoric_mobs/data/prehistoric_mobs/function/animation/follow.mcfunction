execute store result storage prehistoric_mobs:follow least int 1 run data get entity @s UUID[0]
execute store result storage prehistoric_mobs:follow most int 1 run data get entity @s UUID[3]

execute store result storage prehistoric_mobs:follow velocity float 0.01 run function prehistoric_mobs:animation/velocity
execute if score #vector prehistoric_mobs.pos_x matches -200..200 store result storage prehistoric_mobs:follow motion_x float 0.01 run scoreboard players get #vector prehistoric_mobs.pos_x
execute if score #vector prehistoric_mobs.pos_y matches -200..200 store result storage prehistoric_mobs:follow motion_y float 0.01 run scoreboard players get #vector prehistoric_mobs.pos_y
execute if score #vector prehistoric_mobs.pos_z matches -200..200 store result storage prehistoric_mobs:follow motion_z float 0.01 run scoreboard players get #vector prehistoric_mobs.pos_z

function prehistoric_mobs:animation/do_follow with storage prehistoric_mobs:follow