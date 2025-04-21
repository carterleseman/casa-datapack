particle dust{color:[1.0,0.2,1.0],scale:3.5} ~ ~ ~ 0.3 0.3 0.3 0 1 force
execute if entity @s[distance=..1] run damage @s 50 magic by @e[type=ender_dragon,limit=1]
execute unless block ~ ~ ~ obsidian unless entity @s[distance=..1] positioned ^ ^ ^1 as @s run function harderdrag:dragonattacks/dragonexplodenonplayer
