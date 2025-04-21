function prehistoric_mobs:big_beak/egg


# equip saddle on tame
execute as @e[type=minecraft:mule, tag=big_beak] as @s unless items entity @s saddle minecraft:saddle run data merge entity @s {equipment:{saddle:{id:"minecraft:saddle",Count:1b,components:{"minecraft:equippable":{slot:"saddle",asset_id:"empty"}}}}}

# item displays follow the underlying entity
execute as @e[type=minecraft:mule, tag=big_beak] at @s anchored eyes rotated as @s run function prehistoric_mobs:animation/follow

# baby values
execute as @e[type=minecraft:item_display, tag=big_beak.model, tag=prehistoric_mobs.baby] run data modify entity @s transformation.scale set value [0.5, 0.5, 0.5]
execute as @e[type=minecraft:item_display, tag=big_beak.model, tag=!prehistoric_mobs.baby] run data modify entity @s transformation.scale set value [1, 1, 1]
execute as @e[type=minecraft:item_display, tag=big_beak.model, tag=prehistoric_mobs.baby] at @s run tp @s ~ ~-.25 ~

# check mob hurt time for a red glow and sfx
execute as @e[type=minecraft:mule, tag=big_beak] run function prehistoric_mobs:big_beak/hurt

# faster in the air (typically mobs are slower when falling)
execute as @e[type=minecraft:mule, tag=big_beak, nbt={OnGround: false}] run attribute @s minecraft:movement_speed modifier add prehistoric_mobs:glide 0.2 add_value
execute as @e[type=minecraft:mule, tag=big_beak, nbt={OnGround: true}] run attribute @s minecraft:movement_speed modifier remove prehistoric_mobs:glide

# idle sounds
execute as @e[type=minecraft:mule, tag=big_beak] if predicate { condition: "minecraft:random_chance", chance: 0.001 } at @s on controller run playsound minecraft:entity.sniffer.happy ambient @a ~ ~ ~ 0.5 2
execute as @e[type=minecraft:mule, tag=big_beak] if predicate { condition: "minecraft:random_chance", chance: 0.005 } at @s run playsound minecraft:entity.parrot.ambient ambient @a ~ ~ ~ 0.75 0.2
execute as @e[type=minecraft:mule, tag=big_beak, nbt={OnGround: false}] if score @s prehistoric_mobs.animation matches 0 at @s run playsound minecraft:entity.phantom.flap neutral @a ~ ~ ~ 1 2

# body Z wobble
execute as @e[type=minecraft:item_display, tag=big_beak.body] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s start_interpolation set value -1
execute as @e[type=minecraft:item_display, tag=big_beak.body] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s start_interpolation set value -1
execute as @e[type=minecraft:item_display, tag=big_beak.body, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[2] set value -0.025f
execute as @e[type=minecraft:item_display, tag=big_beak.body, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.left_rotation[2] set value 0.025f

# body idle
execute as @e[type=minecraft:item_display, tag=big_beak.body, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[2] set value 0f
execute as @e[type=minecraft:item_display, tag=big_beak.body, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.left_rotation[2] set value 0f

# saddle Z wobble
execute as @e[type=minecraft:item_display, tag=big_beak.saddle, tag=!prehistoric_mobs.saddled] run data modify entity @s transformation.scale set value [0, 0, 0]
execute as @e[type=minecraft:item_display, tag=big_beak.saddle, tag=prehistoric_mobs.saddled] run data modify entity @s transformation.scale set value [1, 1, 1]

execute as @e[type=minecraft:item_display, tag=big_beak.saddle] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s start_interpolation set value -1
execute as @e[type=minecraft:item_display, tag=big_beak.saddle] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s start_interpolation set value -1
execute as @e[type=minecraft:item_display, tag=big_beak.saddle, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[2] set value -0.025f
execute as @e[type=minecraft:item_display, tag=big_beak.saddle, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.left_rotation[2] set value 0.025f

# saddle idle
execute as @e[type=minecraft:item_display, tag=big_beak.saddle, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[2] set value 0f
execute as @e[type=minecraft:item_display, tag=big_beak.saddle, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.left_rotation[2] set value 0f

# head Z wobble opposite body
execute as @e[type=minecraft:item_display, tag=big_beak.head] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s start_interpolation set value -1
execute as @e[type=minecraft:item_display, tag=big_beak.head] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s start_interpolation set value -1
execute as @e[type=minecraft:item_display, tag=big_beak.head, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[2] set value 0.0125f
execute as @e[type=minecraft:item_display, tag=big_beak.head, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.left_rotation[2] set value -0.0125f

# head idle
execute as @e[type=minecraft:item_display, tag=big_beak.head, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[2] set value 0f
execute as @e[type=minecraft:item_display, tag=big_beak.head, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.left_rotation[2] set value 0f
# random head tilt
execute as @e[type=minecraft:item_display, tag=big_beak.head] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[1] set value 0f
execute as @e[type=minecraft:item_display, tag=big_beak.head, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 if predicate { condition: "minecraft:random_chance", chance: 0.1 } run data modify entity @s transformation.left_rotation[1] set value -0.25f
execute as @e[type=minecraft:item_display, tag=big_beak.head, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 if predicate { condition: "minecraft:random_chance", chance: 0.1 } run data modify entity @s transformation.left_rotation[1] set value 0.25f

# baby values
execute as @e[type=minecraft:item_display, tag=big_beak.head, tag=prehistoric_mobs.baby] run data modify entity @s transformation.translation set value [0f, 0f, 0.25f]
execute as @e[type=minecraft:item_display, tag=big_beak.head, tag=!prehistoric_mobs.baby] run data modify entity @s transformation.translation set value [0f, 0f, 0.5f]

# foot step
execute as @e[type=minecraft:item_display, tag=big_beak.foot_left] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s start_interpolation set value -1
execute as @e[type=minecraft:item_display, tag=big_beak.foot_left] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s start_interpolation set value -1
execute as @e[type=minecraft:item_display, tag=big_beak.foot_left, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.5f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_left, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[1] set value 0.4f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_left, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[0] set value -0.1f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_left, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.left_rotation[0] set value 0.1f

execute as @e[type=minecraft:item_display, tag=big_beak.foot_right] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s start_interpolation set value -1
execute as @e[type=minecraft:item_display, tag=big_beak.foot_right] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s start_interpolation set value -1
execute as @e[type=minecraft:item_display, tag=big_beak.foot_right, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.4f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_right, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[1] set value 0.5f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_right, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[0] set value 0.1f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_right, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.left_rotation[0] set value -0.1f

# feet idle
execute as @e[type=minecraft:item_display, tag=big_beak.foot_left, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.4f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_left, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[1] set value 0.4f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_left, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[0] set value 0f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_right, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.4f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_right, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[1] set value 0.4f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_right, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[0] set value 0f

# baby values
execute as @e[type=minecraft:item_display, tag=big_beak.foot_left, tag=prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.25f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_left, tag=prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[1] set value 0.2f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_right, tag=prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.2f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_right, tag=prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[1] set value 0.25f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_left, tag=!prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.2f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_left, tag=!prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[1] set value 0.2f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_right, tag=!prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.2f
execute as @e[type=minecraft:item_display, tag=big_beak.foot_right, tag=!prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[1] set value 0.2f

# wings flap
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s start_interpolation set value -1
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s start_interpolation set value -1
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.left_rotation[2] set value 0.025f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[2] set value 0.1f

execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[0] set value 0.4f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[1] set value 0.775f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[0] set value 0.35f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.725f

execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[0] set value 0.375f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.75f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[2] set value 0f

execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=prehistoric_mobs.falling] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[2] set value 0.025f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=prehistoric_mobs.falling] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.left_rotation[2] set value 1f

# baby values
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[0] set value 0.2f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[1] set value 0.3875f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[0] set value 0.175f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.3625f

execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=!prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[0] set value 0.1875f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_left, tag=!prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.375f

# wing_right
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s start_interpolation set value -1
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s start_interpolation set value -1
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[2] set value -0.025f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.left_rotation[2] set value -0.1f

execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[0] set value -0.4f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.775f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[0] set value -0.35f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[1] set value 0.725f

execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[0] set value -0.375f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.75f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=!prehistoric_mobs.moving] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[2] set value 0f

execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=prehistoric_mobs.falling] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.left_rotation[2] set value -0.025f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=prehistoric_mobs.falling] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.left_rotation[2] set value -1f

# baby values
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[0] set value -0.2f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.3875f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[0] set value -0.175f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 4 run data modify entity @s transformation.translation[1] set value 0.3625f

execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=!prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[0] set value -0.1875f
execute as @e[type=minecraft:item_display, tag=big_beak.wing_right, tag=!prehistoric_mobs.moving, tag=prehistoric_mobs.baby] if score @s prehistoric_mobs.animation matches 0 run data modify entity @s transformation.translation[1] set value 0.375f

# animation ticks
scoreboard players add @e[type=minecraft:mule, tag=big_beak] prehistoric_mobs.animation 1
scoreboard players add @e[type=minecraft:item_display, tag=big_beak.model] prehistoric_mobs.animation 1

execute as @e[type=minecraft:mule, tag=big_beak] if score @s prehistoric_mobs.animation matches 8.. run scoreboard players set @s prehistoric_mobs.animation 0
execute as @e[type=minecraft:item_display, tag=big_beak.model] if score @s prehistoric_mobs.animation matches 8.. run scoreboard players set @s prehistoric_mobs.animation 0

# kill dead big beak entities
execute as @e[type=minecraft:item_display, tag=big_beak.model] run function prehistoric_mobs:big_beak/check_death