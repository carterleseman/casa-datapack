execute as @e[type=ender_dragon,tag=!modified] run function harderdrag:dragonmodify

#Buff Enderman

execute if score endermanbuffs settings matches 1 at @e[type=ender_dragon] run effect give @e[type=enderman,distance=..200] strength 2 0 true
execute if score endermanbuffs settings matches 2 at @e[type=ender_dragon] run effect give @e[type=enderman,distance=..200] strength 2 1 true
execute if score endermanbuffs settings matches 3 at @e[type=ender_dragon] run effect give @e[type=enderman,distance=..200] strength 2 0 true
execute if score endermanbuffs settings matches 4 at @e[type=ender_dragon] run effect give @e[type=enderman,distance=..200] strength 2 1 true

execute if score endermanbuffs settings matches 3 at @e[type=ender_dragon] run effect give @e[type=enderman,distance=..200] speed 2 0 true
execute if score endermanbuffs settings matches 4 at @e[type=ender_dragon] run effect give @e[type=enderman,distance=..200] speed 2 0 true

execute if score endermanbuffs settings matches 1..4 at @e[type=ender_dragon] at @e[type=enderman,distance=..200] positioned ~ ~2 ~ run particle dust{color:[1.0,0.6,0.0],scale:1} ~ ~ ~ 0.3 0.3 0.3 1 1

#Agro Enderman on Dragon hit

execute if score endermanagro? settings matches 1 as @e[type=ender_dragon,nbt={HurtTime:9s}] at @s on attacker run scoreboard players add @s endermanagro 1
execute as @a[scores={endermanagro=3..}] at @s run damage @e[limit=1,sort=nearest,type=enderman] .01 generic by @s
execute as @a[scores={endermanagro=3..}] run scoreboard players set @s endermanagro 0


#Dragon Anger Managment

execute as @e[type=ender_dragon,nbt={HurtTime:9s}] run scoreboard players add dragonanger rando 3
execute as @e[type=ender_dragon,nbt={HurtTime:9s}] at @s run stopsound @a * entity.ender_dragon.hurt
execute as @e[type=ender_dragon,nbt={HurtTime:9s}] at @s run playsound entity.ender_dragon.hurt hostile @a ~ ~ ~ 100 .5

#Display Dragon Health and Anger

execute store result score edraghp? rando run data get entity @e[type=ender_dragon,limit=1] Health
execute if entity @e[type=ender_dragon,nbt=!{DragonPhase:9}] run title @a actionbar [{"text": "Ender Dragon HP: "},{"score": {"name":"edraghp?","objective": "rando"},"color": "dark_purple","bold": true},{"text": "  Dragon Anger: "},{"score": {"name":"dragonanger","objective": "rando"},"color": "dark_purple","bold": true},{"text": "%"}]

#Respawn Crystals

execute store result score edraghp? rando run data get entity @e[type=ender_dragon,limit=1] Health 2.0
execute in minecraft:the_end positioned ~-10 ~-100 ~-10 as @e[tag=crystalspawner,dx=20,dy=200,dz=20] run kill @s
execute as @e[tag=crystalspawner] at @s unless block ~ ~-.5 ~ bedrock run kill @s

execute if score respawncrystals settings matches 1 store result score maxdraghp rando run attribute @e[type=ender_dragon,limit=1] max_health get
execute if score respawncrystals settings matches 1 if score maxdraghp rando >= edraghp? rando if entity @e[type=ender_dragon,tag=!crystalsrespawned] at @e[tag=crystalspawner] unless entity @e[type=end_crystal,distance=..3] run particle explosion_emitter ~ ~ ~ 0.0 0.0 0.0 0 1
execute if score respawncrystals settings matches 1 if score maxdraghp rando >= edraghp? rando if entity @e[type=ender_dragon,tag=!crystalsrespawned] at @e[tag=crystalspawner] unless entity @e[type=end_crystal,distance=..3] run playsound entity.generic.explode master @a ~ ~ ~ 30
execute if score respawncrystals settings matches 1 if score maxdraghp rando >= edraghp? rando if entity @e[type=ender_dragon,tag=!crystalsrespawned] at @e[tag=crystalspawner] unless entity @e[type=end_crystal,distance=..3] run summon end_crystal
execute if score respawncrystals settings matches 1 if score maxdraghp rando >= edraghp? rando if entity @e[type=ender_dragon,tag=!crystalsrespawned] as @a at @s if dimension the_end run tellraw @s [{"text":"Half health Reached! Crystals Respawned","bold": true,"color": "light_purple"}]
execute if score respawncrystals settings matches 1 if score maxdraghp rando >= edraghp? rando as @e[type=ender_dragon,tag=!crystalsrespawned] run tag @s add crystalsrespawned

#Disable Dragons Breath

execute as @e[type=ender_dragon,nbt={DragonPhase:1}] run data merge entity @s {DragonPhase:0}
execute as @e[type=area_effect_cloud,tag=!dragonsbreath] at @s on origin if entity @s[type=ender_dragon] run function harderdrag:dragonattacks/startwave
execute as @e[type=area_effect_cloud] at @s on origin if entity @s[type=ender_dragon] run tag @n add dragonsbreath
kill @e[type=dragon_fireball]

#Stop Enderman Agro on Dragon

team join shulkers @e[type=ender_dragon]
team join shulkers @e[type=enderman]

#Increase Dragon Speed

execute if score dragonspeed settings matches 1 as @e[type=ender_dragon,nbt={DragonPhase:0}] at @s run tp @s ^ ^ ^.25
execute if score dragonspeed settings matches 1 as @e[type=ender_dragon,nbt={DragonPhase:8}] at @s run tp @s ^ ^ ^.25
execute if score dragonspeed settings matches 1 as @e[type=ender_dragon,nbt={DragonPhase:4}] at @s run tp @s ^ ^ ^.25
execute if score dragonspeed settings matches 3 as @e[type=ender_dragon,nbt={DragonPhase:0}] at @s run tp @s ^ ^ ^-.25
execute if score dragonspeed settings matches 3 as @e[type=ender_dragon,nbt={DragonPhase:8}] at @s run tp @s ^ ^ ^-.25
execute if score dragonspeed settings matches 3 as @e[type=ender_dragon,nbt={DragonPhase:4}] at @s run tp @s ^ ^ ^-.25
execute if score dragonspeed settings matches 4 as @e[type=ender_dragon,nbt={DragonPhase:0}] at @s run tp @s ^ ^ ^-.75
execute if score dragonspeed settings matches 4 as @e[type=ender_dragon,nbt={DragonPhase:8}] at @s run tp @s ^ ^ ^-.75
execute if score dragonspeed settings matches 4 as @e[type=ender_dragon,nbt={DragonPhase:4}] at @s run tp @s ^ ^ ^-.75

#Dragon Natural Regen

scoreboard players add dragonregen? rando 1
data modify storage minecraft:dragon draghp set value {"hp":"0"}
execute store result score edraghp? rando run data get entity @e[type=ender_dragon,limit=1] Health
scoreboard players operation edraghp? rando += .1 rando
execute store result storage minecraft:dragon draghp.hp int 1.0 run scoreboard players get edraghp? rando
execute if score dragonregen settings matches 1 if score dragonregen? rando matches 80.. run function harderdrag:dragonbehavior/dragonregen with storage minecraft:dragon draghp
execute if score dragonregen? rando matches 80.. run scoreboard players set dragonregen? rando 0