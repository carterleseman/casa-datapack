scoreboard players set shulkercount rando 0
execute in minecraft:the_end as @e[type=shulker,tag=barrier] run scoreboard players add shulkercount rando 1


execute if score shulkercount rando < maxbarriers settings if entity @e[type=ender_dragon] in the_end run summon shulker 0 70 0 {NoAI:true,Tags:["barrier","justspawned"],Health:100}
execute in the_end run spreadplayers 0 0 20 40 false @e[tag=justspawned]

team join shulkers @e[tag=justspawned]

execute at @e[tag=justspawned,tag=barrier] run summon item_display ~ ~.5 ~ {Invulnerable:true,Tags:[shulkerdeathdetector],item:{id:purple_concrete_powder},transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],scale:[1.1f,1.1f,1.1f],right_rotation:[0f,0f,0f,1f]}}

execute at @e[tag=justspawned] run playsound block.respawn_anchor.charge master @a ~ ~ ~ 100 1 1
effect give @e[tag=justspawned] glowing infinite 1 true
#execute as @e[tag=justspawned] at @s run tellraw @a[tag=!told,distance=..100] [{"text": "","color": "light_purple","bold": true}]
execute at @e[tag=justspawned] as @a[tag=!told,distance=..100] run tag @s add told
execute as @e[tag=justspawned] at @s facing entity @e[type=ender_dragon] feet positioned ~ ~.5 ~ run function harderdrag:particles/particleray

tag @e remove justspawned

execute if score barriercooldown settings matches 15 run schedule function harderdrag:dragonbehavior/spawnbarriers 15s
execute if score barriercooldown settings matches 20 run schedule function harderdrag:dragonbehavior/spawnbarriers 20s
execute if score barriercooldown settings matches 25 run schedule function harderdrag:dragonbehavior/spawnbarriers 25s
execute if score barriercooldown settings matches 30 run schedule function harderdrag:dragonbehavior/spawnbarriers 30s
execute if score barriercooldown settings matches 35 run schedule function harderdrag:dragonbehavior/spawnbarriers 35s
execute if score barriercooldown settings matches 40 run schedule function harderdrag:dragonbehavior/spawnbarriers 40s
execute if score barriercooldown settings matches 45 run schedule function harderdrag:dragonbehavior/spawnbarriers 45s
execute if score barriercooldown settings matches 50 run schedule function harderdrag:dragonbehavior/spawnbarriers 50s
execute if score barriercooldown settings matches 55 run schedule function harderdrag:dragonbehavior/spawnbarriers 55s
execute if score barriercooldown settings matches 60 run schedule function harderdrag:dragonbehavior/spawnbarriers 60s