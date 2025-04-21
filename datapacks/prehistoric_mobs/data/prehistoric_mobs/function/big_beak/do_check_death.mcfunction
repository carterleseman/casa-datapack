$execute if entity @e[type=minecraft:mule, tag=big_beak, scores={ prehistoric_mobs.uuid_least=$(least), prehistoric_mobs.uuid_most=$(most) }] run return fail

kill @s