execute store result storage biome_vote:ai follow.uuid_least int 1 run scoreboard players get @s biome_vote.uuid_least
execute store result storage biome_vote:ai follow.uuid_most int 1 run scoreboard players get @s biome_vote.uuid_most
$data modify storage biome_vote:ai follow.tag set value "$(tag)"

function biome_vote:ai/_follow_tag with storage biome_vote:ai follow