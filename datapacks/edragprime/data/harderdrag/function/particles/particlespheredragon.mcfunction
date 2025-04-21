execute if score @s particle matches 25.. run scoreboard players add @s particle2 1
execute if score @s particle matches 25.. run scoreboard players set @s particle 0

execute positioned ^ ^ ^4 run particle dust{color:[1.0,0.2,1.0],scale:.4} ~ ~ ~ 0.1 0.1 0.1 0 1
scoreboard players add @s particle 1
execute if score @s particle matches ..24 if score @s particle2 matches ..10 rotated ~15 ~ run function harderdrag:particles/particlespheredragon
execute if score @s particle matches 25.. if score @s particle2 matches ..10 rotated ~ ~15 run function harderdrag:particles/particlespheredragon



