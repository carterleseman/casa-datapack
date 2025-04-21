# arguments:
# - uuid_least (int)
# - uuid_most (int)
# - x (int)
# - y (int)
# - z (int)

# set the wander target
$data modify entity @n[type=minecraft:wandering_trader, tag=biome_vote.ai.pathfind, scores={ biome_vote.uuid_least=$(uuid_least), biome_vote.uuid_most=$(uuid_most) }] wander_target set value [I; $(x), $(y), $(z)]

# enable the wandering trader ai
$data modify entity @n[type=minecraft:wandering_trader, tag=biome_vote.ai.pathfind, scores={ biome_vote.uuid_least=$(uuid_least), biome_vote.uuid_most=$(uuid_most) }] NoAI set value false
# enable collisions
$team leave @n[type=minecraft:wandering_trader, tag=biome_vote.ai.pathfind, scores={ biome_vote.uuid_least=$(uuid_least), biome_vote.uuid_most=$(uuid_most) }]

# disable the mimic ai
$data modify entity @n[type=!minecraft:wandering_trader, tag=biome_vote.ai.mimic, scores={ biome_vote.uuid_least=$(uuid_least), biome_vote.uuid_most=$(uuid_most) }] NoAI set value true
# disable collisions
$team join biome_vote.ai.no_collision @n[type=!minecraft:wandering_trader, tag=biome_vote.ai.mimic, scores={ biome_vote.uuid_least=$(uuid_least), biome_vote.uuid_most=$(uuid_most) }]