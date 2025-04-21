# generate between 2 and 5 meerkats
function biome_vote:desert/meerkat/summon
execute positioned ~1 ~ ~ run function biome_vote:desert/meerkat/summon

execute positioned ~-1 ~ ~ if predicate { condition: "minecraft:random_chance", chance: 0.5 } run function biome_vote:desert/meerkat/summon
execute positioned ~ ~ ~1 if predicate { condition: "minecraft:random_chance", chance: 0.5 } run function biome_vote:desert/meerkat/summon
execute positioned ~ ~ ~-1 if predicate { condition: "minecraft:random_chance", chance: 0.5 } run function biome_vote:desert/meerkat/summon

kill @s