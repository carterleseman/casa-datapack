execute if score @s particle matches 9.. run scoreboard players add @s particle2 1
execute if score @s particle matches 9.. run scoreboard players set @s particle 0

execute positioned ^ ^ ^1.5 run particle dust{color:[1.0,0.2,1.0],scale:1.5} ~ ~ ~ 0 0 0 0 1 force
scoreboard players add @s particle 1
execute if score @s particle matches ..8 if score @s particle2 matches ..16 rotated ~40 ~ run function harderdrag:particles/particlesphere
execute if score @s particle matches 9.. if score @s particle2 matches ..16 rotated ~ ~40 run function harderdrag:particles/particlesphere

