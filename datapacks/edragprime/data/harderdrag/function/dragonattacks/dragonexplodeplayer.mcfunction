tag @s remove hit
scoreboard players add @s particle 1
execute if score @s particle matches 20.. run particle dust{color:[1.0,0.2,1.0],scale:3.5} ~ ~ ~ 0.3 0.3 0.3 0 1 force
execute if score @s particle matches 20.. run scoreboard players set @s particle 0

execute if entity @s[dx=0] positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run tag @s add hit
damage @s[tag=hit] 60 magic by @e[type=ender_dragon,limit=1]
execute unless block ~ ~ ~ obsidian unless entity @s[tag=hit] positioned ^ ^ ^.05 as @s run function harderdrag:dragonattacks/dragonexplodeplayer