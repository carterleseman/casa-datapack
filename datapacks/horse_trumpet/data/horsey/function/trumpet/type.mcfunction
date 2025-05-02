execute store result score @s horsey.leashed run data get entity @s leash
execute if score @s horsey.leashed matches 3 run data modify storage horsey:main leash set from entity @s leash

tag @s add horsey.entity
execute at @s run summon area_effect_cloud ~ ~ ~ {Tags:["horsey.cloud"]}
execute as @e[type=area_effect_cloud,tag=horsey.cloud] run ride @e[tag=horsey.entity,limit=1] mount @s
tag @s remove horsey.entity

execute on vehicle run data modify storage horsey:main type set from entity @s Passengers[0].id
kill @e[type=area_effect_cloud,tag=horsey.cloud]

execute if score @s horsey.leashed matches 3 run data modify entity @s leash set from storage horsey:main leash
execute at @s run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:lead"}},distance=..2]

# tellraw @a {"translate":"%s => %s","with":[{"selector":"@s"},{"storage":"horsey:main","nbt":"type"}]}