execute as @e[type=minecraft:item_display, tag=big_beak.egg_setup] at @s align xyz unless block ~ ~ ~ #minecraft:replaceable run tp @s ~ ~1 ~
execute as @e[type=minecraft:item_display, tag=big_beak.egg_setup] at @s align xyz run tp @s ~.5 ~.5 ~.5 0 0
execute as @e[type=minecraft:item_display, tag=big_beak.egg_setup] at @s run setblock ~ ~ ~ minecraft:player_head
execute as @e[type=minecraft:item_display, tag=big_beak.egg_setup] at @s run data modify block ~ ~ ~ profile set value { name: "big_beak.egg" }
execute as @e[type=minecraft:item_display, tag=big_beak.egg_setup] at @s run playsound minecraft:block.metal.place block @a ~ ~ ~ 1 1

tag @e[type=minecraft:item_display, tag=big_beak.egg_setup] add big_beak.egg
tag @e[type=minecraft:item_display, tag=big_beak.egg_setup] remove big_beak.egg_setup

execute as @e[type=minecraft:item_display, tag=big_beak.egg] at @s unless block ~ ~ ~ minecraft:player_head run data modify entity @n[type=minecraft:item,nbt={Item:{id: "minecraft:player_head", components: { "minecraft:profile": { name: "big_beak.egg" } } }}] Item set value { id: "minecraft:allay_spawn_egg", components: { "minecraft:item_model": "prehistoric_mobs:big_beak_egg", "minecraft:entity_data": { "id": "minecraft:item_display", "Tags": ["big_beak.egg_setup"], "item": { "id": "minecraft:stick", "components": { "minecraft:item_model": "prehistoric_mobs:big_beak_egg_block" } }, "transformation": { "translation": [0B, 0B, 0B], "left_rotation": [0B, 0B, 0B, 1B], "right_rotation": [0B, 0B, 0B, 1B], "scale": [1.05d, 1.05d, 1.05d] } }, "minecraft:item_name": "\"Big Beak Egg\"", "minecraft:rarity": "uncommon" } }
execute as @e[type=minecraft:item_display, tag=big_beak.egg] at @s unless block ~ ~ ~ minecraft:player_head run kill @s

# hatching
scoreboard players add @e[type=minecraft:item_display, tag=big_beak.egg] prehistoric_mobs.animation 1

# normal hatching time is 5m
execute as @e[type=minecraft:item_display, tag=big_beak.egg] if score @s prehistoric_mobs.animation matches 6000.. at @s run function prehistoric_mobs:summon/big_beak
execute as @e[type=minecraft:item_display, tag=big_beak.egg] if score @s prehistoric_mobs.animation matches 6000.. at @s run playsound minecraft:block.sniffer_egg.hatch block @a ~ ~ ~ 1 1.5
execute as @e[type=minecraft:item_display, tag=big_beak.egg] if score @s prehistoric_mobs.animation matches 6000.. at @s run playsound minecraft:entity.sniffer.happy neutral @a ~ ~ ~ 0.7 1.5
execute as @e[type=minecraft:item_display, tag=big_beak.egg] if score @s prehistoric_mobs.animation matches 6000.. at @s run setblock ~ ~ ~ minecraft:air
execute as @e[type=minecraft:item_display, tag=big_beak.egg] if score @s prehistoric_mobs.animation matches 6000.. at @s run kill @s

# if there is another egg nearby, this is cut in half
execute as @e[type=minecraft:item_display, tag=big_beak.egg] at @s if entity @e[type=minecraft:item_display, tag=big_beak.egg, distance=0.5..3] if score @s prehistoric_mobs.animation matches 3000.. at @s run function prehistoric_mobs:summon/big_beak
execute as @e[type=minecraft:item_display, tag=big_beak.egg] at @s if entity @e[type=minecraft:item_display, tag=big_beak.egg, distance=0.5..3] if score @s prehistoric_mobs.animation matches 3000.. at @s run playsound minecraft:block.sniffer_egg.hatch block @a ~ ~ ~ 1 1.5
execute as @e[type=minecraft:item_display, tag=big_beak.egg] at @s if entity @e[type=minecraft:item_display, tag=big_beak.egg, distance=0.5..3] if score @s prehistoric_mobs.animation matches 3000.. at @s run playsound minecraft:entity.sniffer.happy neutral @a ~ ~ ~ 0.7 1.5
execute as @e[type=minecraft:item_display, tag=big_beak.egg] at @s if entity @e[type=minecraft:item_display, tag=big_beak.egg, distance=0.5..3] if score @s prehistoric_mobs.animation matches 3000.. at @s run setblock ~ ~ ~ minecraft:air
execute as @e[type=minecraft:item_display, tag=big_beak.egg] at @s if entity @e[type=minecraft:item_display, tag=big_beak.egg, distance=0.5..3] if score @s prehistoric_mobs.animation matches 3000.. at @s run kill @s