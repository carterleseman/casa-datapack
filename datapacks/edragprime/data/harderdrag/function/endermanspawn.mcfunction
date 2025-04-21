scoreboard players set endermancount rando 0
execute in minecraft:the_end as @e[type=enderman] run scoreboard players add endermancount rando 1

execute if entity @e[type=ender_dragon] if score endermancount rando matches 0..100 in the_end run summon enderman 0 20 0 {Tags:[newenderman]}

scoreboard players set endermancount rando 0
execute in minecraft:the_end as @e[type=enderman] run scoreboard players add endermancount rando 1

execute if entity @e[type=ender_dragon] if score endermancount rando matches 0..100 in the_end run summon enderman 0 20 0 {Tags:[newenderman]}

scoreboard players set endermancount rando 0
execute in minecraft:the_end as @e[type=enderman] run scoreboard players add endermancount rando 1

execute if entity @e[type=ender_dragon] if score endermancount rando matches 0..100 in the_end run summon enderman 0 20 0 {Tags:[newenderman]}

scoreboard players set endermancount rando 0
execute in minecraft:the_end as @e[type=enderman] run scoreboard players add endermancount rando 1

execute if entity @e[type=ender_dragon] if score endermancount rando matches 0..100 in the_end run summon enderman 0 20 0 {Tags:[newenderman]}

execute as @e[tag=newenderman] in the_end run spreadplayers 0.0 0.0 10 75 false @e[tag=newenderman]
tag @e remove newenderman

schedule function harderdrag:endermanspawn 4t