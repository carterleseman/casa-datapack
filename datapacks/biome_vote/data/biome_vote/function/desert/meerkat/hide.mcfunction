tag @s add biome_vote.meerkat.hide

# trigger other meerkats nearby to hide
execute as @e[type=minecraft:marker, tag=biome_vote.meerkat, tag=!biome_vote.meerkat.hide, distance=..10] run function biome_vote:desert/meerkat/hide