# arguments:
# - uuid_least (int)
# - uuid_most (int)

# enable the mimic ai
$data modify entity @n[type=!minecraft:wandering_trader, tag=biome_vote.ai.mimic, scores={ biome_vote.uuid_least=$(uuid_least), biome_vote.uuid_most=$(uuid_most) }] NoAI set value false
# enable collisions
$team leave @n[type=!minecraft:wandering_trader, tag=biome_vote.ai.mimic, scores={ biome_vote.uuid_least=$(uuid_least), biome_vote.uuid_most=$(uuid_most) }]

# disable the wandering trader ai
$data modify entity @n[type=minecraft:wandering_trader, tag=biome_vote.ai.pathfind, scores={ biome_vote.uuid_least=$(uuid_least), biome_vote.uuid_most=$(uuid_most) }] NoAI set value true
# disable collisions
$team join biome_vote.ai.no_collision @n[type=minecraft:wandering_trader, tag=biome_vote.ai.pathfind, scores={ biome_vote.uuid_least=$(uuid_least), biome_vote.uuid_most=$(uuid_most) }]