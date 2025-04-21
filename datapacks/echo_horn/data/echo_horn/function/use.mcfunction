advancement revoke @s only echo_horn:use_echo_horn

# apply cooldown
execute if score @s echo_horn.cooldown matches 1.. run return fail

# 7s cooldown matching goat horn cooldown
scoreboard players set @s echo_horn.cooldown 140

execute at @s run summon minecraft:marker ~ ~ ~ { Tags: ["echo_horn.sonic_boom", "echo_horn.sonic_boom.setup"] }

execute at @s anchored eyes rotated as @s run tp @e[type=minecraft:marker,tag=echo_horn.sonic_boom.setup] ^ ^ ^4 ~ ~
tag @e[type=minecraft:marker,tag=echo_horn.sonic_boom.setup] remove echo_horn.sonic_boom.setup

execute at @s run playsound minecraft:entity.warden.sonic_charge

item modify entity @s weapon.mainhand echo_horn:use_echo_horn
item modify entity @s weapon.offhand echo_horn:use_echo_horn