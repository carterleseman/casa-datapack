execute as @e[type=minecraft:marker, tag=biome_vote.meerkat] at @s run function biome_vote:desert/meerkat/_tick
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.underground_hiding] at @s positioned ~ ~-1 ~ run function biome_vote:desert/meerkat/_tick_underground_hiding
execute as @e[type=minecraft:item_display, tag=biome_vote.meerkat.underground_night] at @s positioned ~ ~-1 ~ run function biome_vote:desert/meerkat/_tick_underground_hiding

function biome_vote:desert/meerkat/pose/stand
function biome_vote:desert/meerkat/pose/walk

# summon a random number of meerkats at the marker created as part of worldgen
execute as @e[type=minecraft:marker, tag=biome_vote.desert.meerkat.spawn_target] at @s run function biome_vote:desert/meerkat/spawn_target