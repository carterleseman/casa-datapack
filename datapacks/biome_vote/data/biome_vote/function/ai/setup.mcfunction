# target:
# - type=minecraft:marker

# position:
# - at @s

# arguments:
# - mimic (string, ex: "minecraft:cow")
# - mimic_scale (double, ex: 0.5)
# - wander_scale (double, ex: 0.5)
# - mimic_attributes (string, ex: "{}, {}")
# - wander_attributes (string, ex: "{}, {}")
# - width (double, ex: 0.5)
# - height (double, ex: 0.5)
# - health (int, ex: 10)
# - hurt_sound (string, ex: "minecraft:entity.axolotl.hurt")

# store the uuid in the marker entity's data and scoreboard
# used to select the correct ai entities
execute store result entity @s data.uuid_least int 1 run data get entity @s UUID[0]
execute store result entity @s data.uuid_most int 1 run data get entity @s UUID[3]
execute store result score @s biome_vote.uuid_least run data get entity @s UUID[0]
execute store result score @s biome_vote.uuid_most run data get entity @s UUID[3]

# store the current pos for idle movement checks
execute store result entity @s data._biome_vote__ai__prev_x double 1 run data get entity @s Pos[0]
execute store result entity @s data._biome_vote__ai__prev_y double 1 run data get entity @s Pos[1]
execute store result entity @s data._biome_vote__ai__prev_z double 1 run data get entity @s Pos[2]

tag @s add biome_vote.ai

$data modify entity @s data._biome_vote__ai__hurt_sound set value $(hurt_sound)

# setup a wandering trader for pathfinding
# the wandering trader is set to NoAI by default
$summon minecraft:wandering_trader ~ ~ ~ { Tags: [biome_vote.ai.pathfind, biome_vote.ai.pathfind.setup], Silent: true, Invulnerable: true, active_effects: [{ id: "minecraft:invisibility", duration: -1, show_particles: false }], attributes: [{ id: "minecraft:scale", base: $(wander_scale) }, $(wander_attributes)], NoAI: true }
execute store result score @e[type=minecraft:wandering_trader, tag=biome_vote.ai.pathfind.setup] biome_vote.uuid_least run data get entity @s UUID[0]
execute store result score @e[type=minecraft:wandering_trader, tag=biome_vote.ai.pathfind.setup] biome_vote.uuid_most run data get entity @s UUID[3]
team join biome_vote.ai.no_collision @e[type=minecraft:wandering_trader, tag=biome_vote.ai.pathfind.setup]
tag @e[type=minecraft:wandering_trader, tag=biome_vote.ai.pathfind.setup] remove biome_vote.ai.pathfind.setup

# setup a mob to mimic the behavior of
$summon $(mimic) ~ ~ ~ { Tags: [biome_vote.ai.mimic, biome_vote.ai.mimic.setup], Silent: true, Invulnerable: true, active_effects: [{ id: "minecraft:invisibility", duration: -1, show_particles: false }], attributes: [{ id: "minecraft:scale", base: $(mimic_scale) }, $(mimic_attributes)] }
$execute store result score @e[type=$(mimic), tag=biome_vote.ai.mimic.setup] biome_vote.uuid_least run data get entity @s UUID[0]
$execute store result score @e[type=$(mimic), tag=biome_vote.ai.mimic.setup] biome_vote.uuid_most run data get entity @s UUID[3]
$tag @e[type=$(mimic), tag=biome_vote.ai.mimic.setup] remove biome_vote.ai.mimic.setup

# setup an interaction entity to detect right-clicks and attacks
$summon minecraft:interaction ~ ~ ~ { Tags: [biome_vote.ai.interaction, biome_vote.ai.interaction.setup], width: $(width), height: $(height) }
execute store result score @e[type=minecraft:interaction, tag=biome_vote.ai.interaction.setup] biome_vote.uuid_least run data get entity @s UUID[0]
execute store result score @e[type=minecraft:interaction, tag=biome_vote.ai.interaction.setup] biome_vote.uuid_most run data get entity @s UUID[3]
$scoreboard players set @e[type=minecraft:interaction, tag=biome_vote.ai.interaction.setup] biome_vote.health $(health)
tag @e[type=minecraft:interaction, tag=biome_vote.ai.interaction.setup] remove biome_vote.ai.interaction.setup

execute store result score @e[type=minecraft:item_display, tag=biome_vote.ai.model.setup] biome_vote.uuid_least run data get entity @s UUID[0]
execute store result score @e[type=minecraft:item_display, tag=biome_vote.ai.model.setup] biome_vote.uuid_most run data get entity @s UUID[3]
tag @e[type=minecraft:item_display, tag=biome_vote.ai.model.setup] remove biome_vote.ai.model.setup

# disable collisions between the entities that make up this ai
# function biome_vote:ai/uuid_team with entity @s data