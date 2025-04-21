playsound minecraft:block.sand.break neutral @a ~ ~ ~ 2 1
particle minecraft:block{block_state:{Name:"minecraft:sand"}} ~ ~ ~ 0.25 0 0.25 2 50

# setup the suspicious sand
setblock ~ ~ ~ minecraft:suspicious_sand[dusted=1]{}

# summon a marker passenger to manage the hiding states
$execute positioned ~ ~ ~ align xyz positioned ~.5 ~1 ~.5 run summon minecraft:item_display ~ ~ ~ { Tags: [biome_vote.meerkat.underground_$(reason)], item: { id: "minecraft:barrier", components: { "minecraft:item_model": "biome_vote:entity/meerkat/underground/body" } }, transformation: { translation: [0d, 0d, 0d], left_rotation: [0d, 0d, 0d, 1d], right_rotation: [0d, 0d, 0d, 1d], scale: [0d, 0d, 0d] }, Passengers: [{ id: "minecraft:marker", Tags: [biome_vote.meerkat.underground_$(reason).marker.setup] }, { id: "minecraft:item_display", item: { id: "minecraft:barrier", components: { "minecraft:item_model": "biome_vote:entity/meerkat/underground/head" } }, transformation: { translation: [0d, 0d, 0d], left_rotation: [0d, 0d, 0d, 1d], right_rotation: [0d, 0d, 0d, 1d], scale: [0d, 0d, 0d] } }] }

# copy the home target to the marker so we can restore it when the meerkat pops back out
$data modify entity @n[type=minecraft:marker, tag=biome_vote.meerkat.underground_$(reason).marker.setup] data set from entity @s data

# cleanup the setup tag
$tag @n[type=minecraft:marker, tag=biome_vote.meerkat.underground_$(reason).marker.setup] remove biome_vote.meerkat.underground_$(reason).marker

# remove this meerkat since its underground
kill @s