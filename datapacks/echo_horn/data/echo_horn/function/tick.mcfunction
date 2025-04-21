execute as @a unless score @s echo_horn.cooldown matches ..0 run scoreboard players remove @a echo_horn.cooldown 1

execute as @e[type=minecraft:marker, tag=echo_horn.sonic_boom] at @s rotated as @s run function echo_horn:tick_sonic_boom