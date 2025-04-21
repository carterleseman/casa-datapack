# check if entities should be killed
execute as @e[type=minecraft:wandering_trader, tag=biome_vote.ai.pathfind] run function biome_vote:ai/check_death
execute as @e[type=!minecraft:wandering_trader, tag=biome_vote.ai.mimic] run function biome_vote:ai/check_death
execute as @e[type=minecraft:interaction, tag=biome_vote.ai.interaction] run function biome_vote:ai/check_death
execute as @e[type=minecraft:item_display, tag=biome_vote.ai.model] run function biome_vote:ai/check_death

# the disabled ai entity should follow the enabled one until its re-enabled
execute as @e[type=minecraft:wandering_trader, tag=biome_vote.ai.pathfind, nbt={ NoAI: true }] run function biome_vote:ai/follow_tag { tag: "biome_vote.ai.mimic" }
execute as @e[type=!minecraft:wandering_trader, tag=biome_vote.ai.mimic, nbt={ NoAI: true }] run function biome_vote:ai/follow_tag { tag: "biome_vote.ai.pathfind" }

# the root marker follows the active ai
execute as @e[type=minecraft:marker, tag=biome_vote.ai] run function biome_vote:ai/follow with entity @s data
execute as @e[type=minecraft:marker, tag=biome_vote.ai] run function biome_vote:ai/check_idle with entity @s data

# interaction entity follows the marker
execute as @e[type=minecraft:interaction, tag=biome_vote.ai.interaction] run function biome_vote:ai/follow_root

# any item displays used for this mob should follow the marker as well
execute as @e[type=minecraft:item_display, tag=biome_vote.ai.model] run function biome_vote:ai/follow_root

# update wandering trader invisibility (and remove any hand items, ie milk bucket)
execute as @e[type=minecraft:wandering_trader,tag=biome_vote.ai.pathfind] run effect give @s minecraft:invisibility infinite 1 true
execute as @e[type=minecraft:wandering_trader,tag=biome_vote.ai.pathfind] run data remove entity @s HandItems[0]
execute as @e[type=minecraft:wandering_trader,tag=biome_vote.ai.pathfind] run data remove entity @s HandItems[1]

execute as @e[type=minecraft:interaction, tag=biome_vote.ai.interaction] if data entity @s attack run scoreboard players remove @s biome_vote.health 1
execute as @e[type=minecraft:interaction, tag=biome_vote.ai.interaction] if data entity @s attack at @e[type=minecraft:marker, tag=biome_vote.ai] if score @s biome_vote.uuid_least = @n[type=minecraft:marker, tag=biome_vote.ai] biome_vote.uuid_least if score @s biome_vote.uuid_most = @n[type=minecraft:marker, tag=biome_vote.ai] biome_vote.uuid_most as @n[type=minecraft:marker, tag=biome_vote.ai] run function biome_vote:ai/hurt with entity @s data
execute as @e[type=minecraft:interaction, tag=biome_vote.ai.interaction] if data entity @s attack run data remove entity @s attack
execute as @e[type=minecraft:interaction, tag=biome_vote.ai.interaction] if score @s biome_vote.health matches ..0 at @e[type=minecraft:marker, tag=biome_vote.ai] if score @s biome_vote.uuid_least = @n[type=minecraft:marker, tag=biome_vote.ai] biome_vote.uuid_least if score @s biome_vote.uuid_most = @n[type=minecraft:marker, tag=biome_vote.ai] biome_vote.uuid_most as @n[type=minecraft:marker, tag=biome_vote.ai] run kill @s