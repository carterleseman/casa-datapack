execute as @e[type=minecraft:marker, tag=hungry_dripleaf.setup] run function prehistoric_mobs:hungry_dripleaf/place
execute as @e[type=minecraft:marker, tag=hungry_dripleaf.setup] at @s align xyz positioned ~.5 ~-.005 ~.5 run summon minecraft:interaction ~ ~ ~ { width: 1.01, height: 1.01,  Tags: ["hungry_dripleaf"], Passengers: [{ "id": "minecraft:item_display", "Tags": [ "hungry_dripleaf.model", "hungry_dripleaf.stem" ], "item": { "id": "minecraft:stick", "components": { "minecraft:item_model": "prehistoric_mobs:hungry_dripleaf_stem" } }, "transformation": { "translation": [0f, -0.5f, 0f], "left_rotation": [0, 0, 0, 1], "right_rotation": [0, 0, 0, 1], "scale": [1, 1, 1] } }, { "id": "minecraft:item_display", "Tags": [ "hungry_dripleaf.model", "hungry_dripleaf.bottom" ], "item": { "id": "minecraft:stick", "components": { "minecraft:item_model": "prehistoric_mobs:hungry_dripleaf_bottom" } }, "transformation": { "translation": [0f, -0.5f, 0f], "left_rotation": [0, 0, 0, 1], "right_rotation": [0, 0, 0, 1], "scale": [1, 1, 1] } }, { "id": "minecraft:item_display", "Tags": [ "hungry_dripleaf.model", "hungry_dripleaf.top" ], "item": { "id": "minecraft:stick", "components": { "minecraft:item_model": "prehistoric_mobs:hungry_dripleaf_top" } }, "transformation": { "translation": [0.0f, -0.062f, -0.5f], "left_rotation": [0, 0, 0, 1], "right_rotation": [0, 0, 0, 1], "scale": [1, 1, 1] } }] }
execute as @e[type=minecraft:marker, tag=hungry_dripleaf.setup] unless score @s prehistoric_mobs.facing matches -2147483648..2147483647 at @s align xyz positioned ~.5 ~-.005 ~.5 run rotate @n[type=minecraft:interaction, tag=hungry_dripleaf] facing entity @p feet
execute as @e[type=minecraft:marker, tag=hungry_dripleaf.setup] unless score @s prehistoric_mobs.facing matches -2147483648..2147483647 at @s align xyz positioned ~.5 ~-.005 ~.5 as @n[type=minecraft:interaction, tag=hungry_dripleaf] store result score @s prehistoric_mobs.facing run data get entity @s Rotation[0]
execute as @e[type=minecraft:marker, tag=hungry_dripleaf.setup] if score @s prehistoric_mobs.facing matches -2147483648..2147483647 at @s align xyz positioned ~.5 ~-.005 ~.5 store result score @n[type=minecraft:interaction, tag=hungry_dripleaf] prehistoric_mobs.facing run scoreboard players get @s prehistoric_mobs.facing
execute as @e[type=minecraft:marker, tag=hungry_dripleaf.setup] at @s if block ~ ~ ~ minecraft:water run setblock ~ ~ ~ minecraft:barrier[waterlogged=true]
execute as @e[type=minecraft:marker, tag=hungry_dripleaf.setup] at @s unless block ~ ~ ~ minecraft:barrier[waterlogged=true] run setblock ~ ~ ~ minecraft:barrier
execute as @e[type=minecraft:marker, tag=hungry_dripleaf.setup] at @s run playsound minecraft:block.big_dripleaf.place block @a ~ ~ ~ 1 1
execute as @e[type=minecraft:marker, tag=hungry_dripleaf.setup] run kill @s

execute as @e[type=minecraft:item_display, tag=hungry_dripleaf.top] unless score @s prehistoric_mobs.animation matches -2147483648..2147483647 run scoreboard players set @s prehistoric_mobs.animation 0

# if the player clicks the block, destroy it
tag @e[type=minecraft:interaction, tag=hungry_dripleaf, nbt={attack:{}}] add hungry_dripleaf.destroy
# if the block underneath it is gone, destroy it. also make sure we're not just on a stem
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf] at @s if block ~ ~ ~ #minecraft:replaceable positioned ~ ~-1 ~ unless entity @e[type=minecraft:interaction,tag=hungry_dripleaf,tag=!hungry_dripleaf.destroy,distance=..0.1] run tag @s add hungry_dripleaf.destroy
# if its just a stem and the dripleaf above was broken, destroy it
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf.stem_only] at @s positioned ~ ~1.005 ~ unless entity @e[type=minecraft:interaction,tag=hungry_dripleaf,tag=!hungry_dripleaf.destroy,distance=..0.1] run tag @s add hungry_dripleaf.destroy
# if the block is not a barrier or a light block, then the player pushed a new block in (probably with a piston), so destroy it
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf] at @s unless block ~ ~.005 ~ minecraft:light unless block ~ ~.005 ~ minecraft:barrier run tag @s add hungry_dripleaf.destroy

execute as @e[type=minecraft:interaction, tag=hungry_dripleaf.destroy] at @s run playsound minecraft:block.big_dripleaf.break block @a ~ ~ ~ 1 1
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf.destroy] at @s run summon minecraft:item ~ ~.5 ~ { Item: { id: "minecraft:allay_spawn_egg", components: { "minecraft:item_model": "prehistoric_mobs:hungry_dripleaf", "minecraft:entity_data": { "id": "minecraft:marker", "Tags": ["hungry_dripleaf.setup"] }, "minecraft:item_name": "\"Hungry Dripleaf\"", "minecraft:rarity": "uncommon" } } }
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf.destroy] at @s run setblock ~ ~.005 ~ minecraft:air
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf.destroy] at @s run particle minecraft:block{block_state:{Name:"minecraft:big_dripleaf"}} ~ ~.5 ~ 0.1 0.1 0.1 0.1 10
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf.destroy] on passengers run kill @s
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf.destroy] run kill @s

execute as @e[type=minecraft:interaction, tag=hungry_dripleaf] at @s on target if items entity @s weapon.mainhand minecraft:allay_spawn_egg[minecraft:item_name="\"Hungry Dripleaf\""] as @n[type=minecraft:interaction, tag=hungry_dripleaf] run function prehistoric_mobs:hungry_dripleaf/grow
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf] if data entity @s interaction run data remove entity @s interaction

# bite entities standing on top
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf, tag=!hungry_dripleaf.stem_only] if score @s prehistoric_mobs.animation matches 6.. at @s positioned ~ ~1.005 ~ as @e[distance=..1, nbt={OnGround:true, HurtTime: 0s}, predicate=!prehistoric_mobs:sneaking] run function prehistoric_mobs:hungry_dripleaf/attack

# animate the mouth opening
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf, tag=!hungry_dripleaf.stem_only] at @s positioned ~ ~1.005 ~ if entity @e[type=!minecraft:interaction, type=!minecraft:item_display, distance=..1.5, nbt={HurtTime:0s}, predicate=!prehistoric_mobs:sneaking] on passengers if entity @s[tag=hungry_dripleaf.top] unless score @s prehistoric_mobs.animation matches 1.. run playsound minecraft:block.big_dripleaf.tilt_up hostile @a ~ ~ ~ 1 1
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf, tag=!hungry_dripleaf.stem_only] at @s positioned ~ ~1.005 ~ if entity @e[type=!minecraft:interaction, type=!minecraft:item_display, distance=..1.5, nbt={HurtTime:0s}, predicate=!prehistoric_mobs:sneaking] on passengers if entity @s[tag=hungry_dripleaf.top] unless score @s prehistoric_mobs.animation matches 5.. run scoreboard players add @s prehistoric_mobs.animation 2
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf, tag=!hungry_dripleaf.stem_only] at @s positioned ~ ~1.005 ~ unless entity @e[type=!minecraft:interaction, type=!minecraft:item_display, distance=..1.5, nbt={HurtTime:0s}, predicate=!prehistoric_mobs:sneaking] on passengers if entity @s[tag=hungry_dripleaf.top] unless score @s prehistoric_mobs.animation matches ..0 run scoreboard players remove @s prehistoric_mobs.animation 2
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf, tag=!hungry_dripleaf.stem_only] at @s positioned ~ ~1.005 ~ if entity @e[type=!minecraft:interaction, type=!minecraft:item_display, distance=..1.5, nbt={HurtTime:0s}, predicate=!prehistoric_mobs:sneaking] unless score @s prehistoric_mobs.animation matches 6.. run scoreboard players add @s prehistoric_mobs.animation 2
execute as @e[type=minecraft:interaction, tag=hungry_dripleaf, tag=!hungry_dripleaf.stem_only] at @s positioned ~ ~1.005 ~ unless entity @e[type=!minecraft:interaction, type=!minecraft:item_display, distance=..1.5, nbt={HurtTime:0s}, predicate=!prehistoric_mobs:sneaking] unless score @s prehistoric_mobs.animation matches ..0 run scoreboard players remove @s prehistoric_mobs.animation 2
execute as @e[type=minecraft:item_display, tag=hungry_dripleaf.top] store result entity @s transformation.left_rotation[0] float -0.1 run scoreboard players get @s prehistoric_mobs.animation

# rotate properly
execute as @e[type=minecraft:item_display, tag=hungry_dripleaf.model] store result score @s prehistoric_mobs.facing on vehicle run scoreboard players get @s prehistoric_mobs.facing
execute as @e[type=minecraft:item_display, tag=hungry_dripleaf.model] if score @s prehistoric_mobs.facing matches -120..-50 run rotate @s -90 0
execute as @e[type=minecraft:item_display, tag=hungry_dripleaf.model] if score @s prehistoric_mobs.facing matches -49..50 run rotate @s 0 0
execute as @e[type=minecraft:item_display, tag=hungry_dripleaf.model] if score @s prehistoric_mobs.facing matches 51..135 run rotate @s 90 0
execute as @e[type=minecraft:item_display, tag=hungry_dripleaf.model] if score @s prehistoric_mobs.facing matches 51..135 run rotate @s 90 0
execute as @e[type=minecraft:item_display, tag=hungry_dripleaf.model] if score @s prehistoric_mobs.facing matches ..-121 run rotate @s 180 0
execute as @e[type=minecraft:item_display, tag=hungry_dripleaf.model] if score @s prehistoric_mobs.facing matches 135.. run rotate @s 180 0