# remove the idle tag from all models
$tag @e[type=minecraft:item_display, tag=biome_vote.ai.model, tag=biome_vote.ai.idle, scores={ biome_vote.uuid_least=$(uuid_least), biome_vote.uuid_most=$(uuid_most) }] remove biome_vote.ai.idle

# add the idle tag if the prev_* pos = the current pos
$execute if data entity @s { Pos: [$(_biome_vote__ai__prev_x)d, $(_biome_vote__ai__prev_y)d, $(_biome_vote__ai__prev_z)d] } run tag @e[type=minecraft:item_display, tag=biome_vote.ai.model, scores={ biome_vote.uuid_least=$(uuid_least), biome_vote.uuid_most=$(uuid_most) }] add biome_vote.ai.idle

# store the new position
data modify entity @s data._biome_vote__ai__prev_x set from entity @s Pos[0]
data modify entity @s data._biome_vote__ai__prev_y set from entity @s Pos[1]
data modify entity @s data._biome_vote__ai__prev_z set from entity @s Pos[2]