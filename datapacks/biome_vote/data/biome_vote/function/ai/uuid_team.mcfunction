# a team is created for the uuid of the entity to remove collisions between multiple entities
$team add $(uuid_least)_$(uuid_most)
$team modify $(uuid_least)_$(uuid_most) collisionRule never
$team join $(uuid_least)_$(uuid_most) @e[scores={ biome_vote.uuid_least=$(uuid_least), biome_vote.uuid_most=$(uuid_most) }]