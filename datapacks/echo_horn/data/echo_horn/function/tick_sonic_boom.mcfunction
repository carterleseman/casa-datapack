scoreboard players add @s echo_horn.range 2

# wait 8 ticks before starting
execute if score @s echo_horn.range matches ..16 run return fail

# now start
execute if score @s echo_horn.range matches 48.. at @s run playsound minecraft:entity.warden.sonic_boom player @a ~ ~ ~
execute if score @s echo_horn.range matches 48.. at @s rotated as @s positioned ^ ^ ^-16 run playsound minecraft:entity.warden.sonic_boom player @a ~ ~ ~
execute if score @s echo_horn.range matches 48.. run kill @s

tp @s ^ ^ ^1
execute at @s as @e[distance=..3] run damage @s 6 minecraft:sonic_boom at ~ ~ ~

particle minecraft:sonic_boom