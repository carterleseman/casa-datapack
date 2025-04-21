#Ground Wave

execute as @e[type=item_display,tag=wave] at @s if block ~ ~ ~ obsidian run kill @s
execute as @e[type=item_display,tag=wave] at @s if block ~ ~ ~ bedrock run kill @s

execute as @e[type=item_display,tag=wave,scores={wavedistance=1..}] run scoreboard players remove @s wavedistance 1
execute as @e[type=item_display,tag=wave,scores={wavedistance=1..}] at @s run tp @s ^ ^ ^.25
execute as @e[type=item_display,tag=wave,scores={wavedistance=1..}] at @s unless block ~ ~ ~ air run tp @s ~ ~.5 ~
execute as @e[type=item_display,tag=wave,scores={wavedistance=1..}] at @s if block ~ ~-.5 ~ air run tp @s ~ ~-.5 ~

execute as @e[type=item_display,tag=wave,scores={wavedistance=1..}] at @s run particle dust{scale:.8,color:[1.0,0.2,1.0]} ~ ~.05 ~ 0.3 0.0 0.3 0 1 force
execute as @e[type=item_display,tag=wave,scores={wavedistance=1..70}] at @s run particle dust{scale:1.3,color:[1.0,0.2,1.0]} ~ ~.05 ~ 0.3 0.0 0.3 0 1

execute at @e[type=item_display,tag=wave,scores={wavedistance=1..}] if entity @e[dx=0] positioned ~ ~-.7 ~ as @e[dx=0,type=!item_display,tag=!barrier,type=!enderman,type=!item,type=!experience_orb] run damage @s 18 magic
execute at @e[type=item_display,tag=wave,scores={wavedistance=1..}] if entity @e[dx=0] positioned ~ ~-.7 ~ as @e[dx=0,type=enderman] run damage @s 2 magic

execute as @e[type=item_display,tag=wave,scores={wavedistance=..0}] run kill @s

#Missle Shoot

execute if score wavecooldown rando matches 1.. if entity @e[type=ender_dragon,nbt={DragonPhase:0}] run scoreboard players remove wavecooldown rando 1
execute if score wavecooldown rando matches 1.. if entity @e[type=ender_dragon,nbt={DragonPhase:2}] run scoreboard players remove wavecooldown rando 1
execute if score wavecooldown rando matches 0 at @e[type=ender_dragon,limit=1] run playsound entity.ender_dragon.shoot master @a ~ ~ ~ 40
execute if score wavecooldown rando matches 0 at @e[type=ender_dragon,limit=1] if entity @a[distance=10..150] at @a[distance=10..150,sort=random,limit=1] run summon item_display ~ ~ ~ {Tags:[shockwavetarget,newwave],view_range:0}
execute if score wavecooldown rando matches 0 at @e[type=ender_dragon,limit=1] if entity @e[tag=shockwavetarget] positioned ^ ^ ^-5 run summon item_display ~ ~ ~ {Tags:[shockwaveprojectile,newwave],view_range:0}
execute if score wavecooldown rando matches 0 store result score wavecooldown rando run random value 140..300


execute if score fireballaccuracy settings matches 3 as @e[tag=newwave,tag=shockwavetarget] at @s run spreadplayers ~ ~ 0 3 false @s
execute if score fireballaccuracy settings matches 5 as @e[tag=newwave,tag=shockwavetarget] at @s run spreadplayers ~ ~ 0 5 false @s
execute if score fireballaccuracy settings matches 7 as @e[tag=newwave,tag=shockwavetarget] at @s run spreadplayers ~ ~ 0 7 false @s
execute if score fireballaccuracy settings matches 9 as @e[tag=newwave,tag=shockwavetarget] at @s run spreadplayers ~ ~ 0 9 false @s
execute if score fireballaccuracy settings matches 11 as @e[tag=newwave,tag=shockwavetarget] at @s run spreadplayers ~ ~ 0 11 false @s
execute if score fireballaccuracy settings matches 13 as @e[tag=newwave,tag=shockwavetarget] at @s run spreadplayers ~ ~ 0 13 false @s
execute if score fireballaccuracy settings matches 15 as @e[tag=newwave,tag=shockwavetarget] at @s run spreadplayers ~ ~ 0 15 false @s
execute if score fireballaccuracy settings matches 40 as @e[tag=newwave,tag=shockwavetarget] at @s run spreadplayers ~ ~ 0 40 false @s


execute as @e[tag=newwave,tag=shockwaveprojectile] at @s rotated as @e[type=ender_dragon] rotated as @e[type=ender_dragon] facing ^ ^1 ^-5 run tp @s ~ ~ ~ ~ ~

tag @e remove newwave

#Missle Tick

execute if score fireballsound settings matches 1 as @e[tag=shockwaveprojectile] at @s run playsound block.furnace.fire_crackle master @a ~ ~ ~ 40 1
execute if score fireballsound settings matches 2 as @e[tag=shockwaveprojectile] at @s run playsound block.wooden_button.click_off master @a ~ ~ ~ 10 2
execute if score fireballsound settings matches 3 as @e[tag=shockwaveprojectile] at @s run playsound block.lava.pop master @a ~ ~ ~ 10 2
execute if score fireballsound settings matches 4 as @e[tag=shockwaveprojectile] at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 10 1
execute if score fireballsound settings matches 5 as @e[tag=shockwaveprojectile] at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 10 2
execute if score fireballsound settings matches 6 as @e[tag=shockwaveprojectile] at @s run playsound entity.firework_rocket.twinkle_far master @a ~ ~ ~ 5 1.2

execute as @e[tag=shockwaveprojectile] at @s run particle dust{scale:4,color:[1.0,0.2,1.0]} ~ ~ ~ 0.1 0.1 0.1 0 2 force
execute as @e[tag=shockwaveprojectile] at @s run particle explosion ~ ~ ~ 0.1 0.1 0.1 0 1 force

execute if score fireballspeed settings matches 1 as @e[tag=shockwaveprojectile] at @s anchored eyes facing entity @e[tag=shockwavetarget,limit=1,sort=nearest] eyes positioned ^ ^ ^3 rotated as @s positioned ^ ^ ^20 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ^ ^ ^.5 ~ ~
execute if score fireballspeed settings matches 2 as @e[tag=shockwaveprojectile] at @s anchored eyes facing entity @e[tag=shockwavetarget,limit=1,sort=nearest] eyes positioned ^ ^ ^3 rotated as @s positioned ^ ^ ^15 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ^ ^ ^1 ~ ~
execute if score fireballspeed settings matches 3 as @e[tag=shockwaveprojectile] at @s anchored eyes facing entity @e[tag=shockwavetarget,limit=1,sort=nearest] eyes positioned ^ ^ ^3 rotated as @s positioned ^ ^ ^13 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ^ ^ ^1.5 ~ ~
execute if score fireballspeed settings matches 4 as @e[tag=shockwaveprojectile] at @s anchored eyes facing entity @e[tag=shockwavetarget,limit=1,sort=nearest] eyes positioned ^ ^ ^3 rotated as @s positioned ^ ^ ^7 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ^ ^ ^2.5 ~ ~

#Missle Land

execute as @e[tag=shockwaveprojectile] at @s if entity @e[tag=shockwavetarget,distance=..2] at @e[tag=shockwavetarget,distance=..3,limit=1,sort=nearest] as @e[distance=..4,type=!item] run damage @s 20 explosion
execute as @e[tag=shockwaveprojectile] at @s if entity @e[tag=shockwavetarget,distance=..2] at @e[tag=shockwavetarget,distance=..3,limit=1,sort=nearest] run particle explosion_emitter ~ ~ ~ 0 0 0 1 1 force
execute as @e[tag=shockwaveprojectile] at @s if entity @e[tag=shockwavetarget,distance=..2] at @e[tag=shockwavetarget,distance=..3,limit=1,sort=nearest] run playsound entity.generic.explode master @a ~ ~ ~ 15
execute as @e[tag=shockwaveprojectile] at @s if entity @e[tag=shockwavetarget,distance=..2] at @e[tag=shockwavetarget,distance=..3,limit=1,sort=nearest] run function harderdrag:dragonattacks/startwave


execute if score fireballobsidian settings matches 1 as @e[tag=shockwaveprojectile] at @s unless block ~ ~ ~ air unless block ~ ~ ~ obsidian as @e[distance=..3,type=!item] run damage @s 20 explosion
execute if score fireballobsidian settings matches 1 as @e[tag=shockwaveprojectile] at @s unless block ~ ~ ~ air unless block ~ ~ ~ obsidian run particle explosion_emitter ~ ~ ~ 0 0 0 1 1 force
execute if score fireballobsidian settings matches 1 as @e[tag=shockwaveprojectile] at @s unless block ~ ~ ~ air unless block ~ ~ ~ obsidian run playsound entity.generic.explode master @a ~ ~ ~ 40
execute if score fireballobsidian settings matches 1 as @e[tag=shockwaveprojectile] at @s unless block ~ ~ ~ air unless block ~ ~ ~ obsidian run function harderdrag:dragonattacks/startwave


execute if score fireballobsidian settings matches 0 as @e[tag=shockwaveprojectile] at @s unless block ~ ~ ~ air as @e[distance=..3,type=!item] run damage @s 20 explosion
execute if score fireballobsidian settings matches 0 as @e[tag=shockwaveprojectile] at @s unless block ~ ~ ~ air run particle explosion_emitter ~ ~ ~ 0 0 0 1 1 force
execute if score fireballobsidian settings matches 0 as @e[tag=shockwaveprojectile] at @s unless block ~ ~ ~ air run playsound entity.generic.explode master @a ~ ~ ~ 40
execute if score fireballobsidian settings matches 0 as @e[tag=shockwaveprojectile] at @s unless block ~ ~ ~ air run function harderdrag:dragonattacks/startwave