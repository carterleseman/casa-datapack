execute at @e[type=minecraft:mule, tag=big_beak] if score @s prehistoric_mobs.uuid_least = @n[type=minecraft:mule, tag=big_beak] prehistoric_mobs.uuid_least if score @s prehistoric_mobs.uuid_most = @n[type=minecraft:mule, tag=big_beak] prehistoric_mobs.uuid_most run return fail

execute if entity @s[tag=big_beak.head] at @s run playsound minecraft:entity.parrot.death neutral @a ~ ~ ~ 1 0.75

kill @s
# execute store result storage prehistoric_mobs:big_beak_death least int 1 run scoreboard players get @s prehistoric_mobs.uuid_least
# execute store result storage prehistoric_mobs:big_beak_death most int 1 run scoreboard players get @s prehistoric_mobs.uuid_most

# function prehistoric_mobs:big_beak/do_check_death with storage prehistoric_mobs:big_beak_death