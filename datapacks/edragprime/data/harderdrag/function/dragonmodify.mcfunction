data merge entity @s {CustomName:{"text": "Ender Dragon Prime","color": "dark_gray","bold": true}}

execute if score dragonhp settings matches 100 run attribute @s max_health base set 100
execute if score dragonhp settings matches 100 run data merge entity @s {Health:100}

execute if score dragonhp settings matches 200 run attribute @s max_health base set 200
execute if score dragonhp settings matches 200 run data merge entity @s {Health:200}

execute if score dragonhp settings matches 300 run attribute @s max_health base set 300
execute if score dragonhp settings matches 300 run data merge entity @s {Health:300}

execute if score dragonhp settings matches 400 run attribute @s max_health base set 400
execute if score dragonhp settings matches 400 run data merge entity @s {Health:400}

execute if score dragonhp settings matches 500 run attribute @s max_health base set 500
execute if score dragonhp settings matches 500 run data merge entity @s {Health:500}

execute if score dragonhp settings matches 600 run attribute @s max_health base set 600
execute if score dragonhp settings matches 600 run data merge entity @s {Health:600}

execute if score dragonhp settings matches 700 run attribute @s max_health base set 700
execute if score dragonhp settings matches 700 run data merge entity @s {Health:700}

execute if score dragonhp settings matches 800 run attribute @s max_health base set 800
execute if score dragonhp settings matches 800 run data merge entity @s {Health:800}

execute if score dragonhp settings matches 900 run attribute @s max_health base set 900
execute if score dragonhp settings matches 900 run data merge entity @s {Health:900}

execute if score dragonhp settings matches 1000 run attribute @s max_health base set 1000
execute if score dragonhp settings matches 1000 run data merge entity @s {Health:1000}

execute at @e[type=end_crystal] if entity @e[type=ender_dragon,distance=..500] unless entity @e[tag=crystalspawner,distance=..2] run summon item_display ~ ~ ~ {Tags:["crystalspawner"],Invulnerable:true}

scoreboard players set dragonanger rando 0
tag @s add modified
