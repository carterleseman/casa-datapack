# check if a marker for the entity's uuid score still exists
execute at @e[type=minecraft:marker, tag=biome_vote.ai] if score @s biome_vote.uuid_least = @n[type=minecraft:marker, tag=biome_vote.ai] biome_vote.uuid_least if score @s biome_vote.uuid_most = @n[type=minecraft:marker, tag=biome_vote.ai] biome_vote.uuid_most run return fail

# otherwise, kill the entity
kill @s