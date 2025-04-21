function biome_vote:desert/meerkat/summon

# copy the home position back into the new entity
execute on passengers if entity @s[type=minecraft:marker] run data modify entity @n[type=minecraft:marker, tag=biome_vote.meerkat] data.x set from entity @s data.x
execute on passengers if entity @s[type=minecraft:marker] run data modify entity @n[type=minecraft:marker, tag=biome_vote.meerkat] data.y set from entity @s data.y
execute on passengers if entity @s[type=minecraft:marker] run data modify entity @n[type=minecraft:marker, tag=biome_vote.meerkat] data.z set from entity @s data.z

execute on passengers run kill @s
kill @s