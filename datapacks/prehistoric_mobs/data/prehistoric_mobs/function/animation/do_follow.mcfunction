$execute as @e[type=minecraft:item_display, scores={ prehistoric_mobs.uuid_least=$(least), prehistoric_mobs.uuid_most=$(most) }] run tp @s ~$(motion_x) ~ ~$(motion_z) ~ 0
$execute if score #vector prehistoric_mobs.pos_y matches ..0 as @e[type=minecraft:item_display, scores={ prehistoric_mobs.uuid_least=$(least), prehistoric_mobs.uuid_most=$(most) }] at @s rotated as @s run tp @s ~ ~$(motion_y) ~
$execute as @e[type=minecraft:item_display, scores={ prehistoric_mobs.uuid_least=$(least), prehistoric_mobs.uuid_most=$(most) }] at @s rotated as @s run tp @s ^ ^.5 ^.1

$tag @e[type=minecraft:item_display, scores={ prehistoric_mobs.uuid_least=$(least), prehistoric_mobs.uuid_most=$(most) }, tag=prehistoric_mobs.moving] remove prehistoric_mobs.moving
$tag @e[type=minecraft:item_display, scores={ prehistoric_mobs.uuid_least=$(least), prehistoric_mobs.uuid_most=$(most) }, tag=prehistoric_mobs.falling] remove prehistoric_mobs.falling
$execute if data entity @s { OnGround: true } as @e[type=minecraft:item_display, scores={ prehistoric_mobs.uuid_least=$(least), prehistoric_mobs.uuid_most=$(most) }] if score #result prehistoric_mobs.pos_x matches 1.. run tag @s add prehistoric_mobs.moving
$execute if data entity @s { OnGround: false } as @e[type=minecraft:item_display, scores={ prehistoric_mobs.uuid_least=$(least), prehistoric_mobs.uuid_most=$(most) }] run tag @s add prehistoric_mobs.falling

# scale based on age
$tag @e[type=minecraft:item_display, scores={ prehistoric_mobs.uuid_least=$(least), prehistoric_mobs.uuid_most=$(most) }, tag=prehistoric_mobs.baby] remove prehistoric_mobs.baby
$execute unless data entity @s { Age: 0 } as @e[type=minecraft:item_display, scores={ prehistoric_mobs.uuid_least=$(least), prehistoric_mobs.uuid_most=$(most) }] run tag @s add prehistoric_mobs.baby

# saddle check
$tag @e[type=minecraft:item_display, scores={ prehistoric_mobs.uuid_least=$(least), prehistoric_mobs.uuid_most=$(most) }, tag=prehistoric_mobs.saddled] remove prehistoric_mobs.saddled
$execute if data entity @s SaddleItem as @e[type=minecraft:item_display, scores={ prehistoric_mobs.uuid_least=$(least), prehistoric_mobs.uuid_most=$(most) }] run tag @s add prehistoric_mobs.saddled