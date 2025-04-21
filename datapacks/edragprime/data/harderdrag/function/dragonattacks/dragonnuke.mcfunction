#Dragon Nuke

execute if score dragonanger rando matches 100.. run scoreboard players set dragonanger rando 100
execute if score dragonanger rando matches 100.. run scoreboard players add dragonexplode rando 1

execute if score dragonexplode rando matches 1..40 at @e[type=ender_dragon] run particle explosion ~ ~2 ~ 0 0 0 1 1 force

execute if score dragonexplode rando matches 1..40 at @e[type=ender_dragon] run playsound block.conduit.activate master @a ~ ~ ~ 100 2 1
execute if score dragonexplode rando matches 1..40 at @e[type=ender_dragon] run stopsound @a * entity.ender_dragon.growl

execute if score dragonexplode rando matches 41.. run stopsound @a * block.conduit.activate
execute if score dragonexplode rando matches 41 at @e[type=ender_dragon] run playsound item.lodestone_compass.lock master @a ~ ~ ~ 100 2 1
execute if score dragonexplode rando matches 60.. at @e[type=ender_dragon] run playsound block.end_portal.spawn master @a ~ ~ ~ 100 .5 1
execute if score dragonexplode rando matches 60.. at @e[type=ender_dragon] run playsound entity.generic.explode master @a ~ ~ ~ 100 .7 1

execute if score dragonexplode rando matches 60.. at @e[type=ender_dragon,limit=1] as @e[type=squid,distance=..150] facing entity @s eyes positioned ^ ^ ^3 run function harderdrag:dragonattacks/dragonexplodeplayer

execute if score dragonexplode rando matches 60.. at @e[type=ender_dragon,limit=1] as @a[distance=..150] facing entity @s eyes positioned ^ ^ ^3 run function harderdrag:dragonattacks/dragonexplodeplayer
execute if score dragonexplode rando matches 60.. at @e[type=ender_dragon,limit=1] as @e[distance=..150,type=!item,type=!shulker,type=!item_display,type=!end_crystal,type=!ender_dragon,type=!player,type=!shulker_bullet,type=!experience_bottle] facing entity @s feet positioned ^ ^ ^3 run function harderdrag:dragonattacks/dragonexplodenonplayer

execute if score dragonselfdamage settings matches 10 if score dragonexplode rando matches 60.. as @e[type=ender_dragon] at @s run damage @s 40 generic by @p
execute if score dragonselfdamage settings matches 20 if score dragonexplode rando matches 60.. as @e[type=ender_dragon] at @s run damage @s 80 generic by @p
execute if score dragonselfdamage settings matches 30 if score dragonexplode rando matches 60.. as @e[type=ender_dragon] at @s run damage @s 120 generic by @p
execute if score dragonselfdamage settings matches 40 if score dragonexplode rando matches 60.. as @e[type=ender_dragon] at @s run damage @s 159 generic by @p
execute if score dragonselfdamage settings matches 50 if score dragonexplode rando matches 60.. as @e[type=ender_dragon] at @s run damage @s 199 generic by @p

execute if score dragonexplode rando matches 60.. run scoreboard players set dragonanger rando 0
execute if score dragonexplode rando matches 60.. run scoreboard players set dragonexplode rando 0