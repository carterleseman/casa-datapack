# the player added another hungry dripleaf, so the plant gets larger
execute positioned ~ ~1.005 ~ if entity @e[type=minecraft:interaction,tag=hungry_dripleaf,distance=..0.1] run return fail
summon minecraft:marker ~ ~1.005 ~ { Tags: ["hungry_dripleaf.setup"] }
# copy the rotation
execute positioned ~ ~1.005 ~ store result score @n[type=minecraft:marker, tag=hungry_dripleaf.setup] prehistoric_mobs.facing run scoreboard players get @s prehistoric_mobs.facing

# with another on top, we're just a stem
execute on passengers unless entity @s[tag=hungry_dripleaf.stem] run kill @s
execute if block ~ ~.005 ~ minecraft:barrier[waterlogged=true] run setblock ~ ~.005 ~ minecraft:light[level=0,waterlogged=true]
execute if block ~ ~.005 ~ minecraft:barrier[waterlogged=false] run setblock ~ ~.005 ~ minecraft:light[level=0]
tag @s add hungry_dripleaf.stem_only

execute on target run item modify entity @s weapon.mainhand { function: "minecraft:set_count", count: -1, add: true }