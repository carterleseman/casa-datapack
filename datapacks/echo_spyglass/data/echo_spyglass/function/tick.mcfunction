effect clear @a[tag=echo_spyglass.was_using] minecraft:blindness
team leave @a[tag=echo_spyglass.was_using]
execute as @a[tag=echo_spyglass.was_using] run kill @e[type=minecraft:text_display,tag=echo_spyglass.particle]
execute as @a[tag=echo_spyglass.was_using] at @s run playsound minecraft:block.sculk_sensor.clicking_stop ambient @s ~ ~ ~ 5 0.1
execute as @a[tag=echo_spyglass.was_using] at @s run effect clear @e[type=!minecraft:text_display, distance=2..100] minecraft:glowing
execute as @a[tag=echo_spyglass.was_using] at @s run team leave @e[type=!minecraft:text_display, distance=2..100]
execute as @a[tag=echo_spyglass.was_using] at @s run scoreboard players reset @e[type=!minecraft:text_display, distance=2..100] echo_spyglass.gaze_time
tag @a[tag=echo_spyglass.was_using] remove echo_spyglass.using
tag @a[tag=echo_spyglass.was_using] remove echo_spyglass.was_using

tag @a[tag=echo_spyglass.using] add echo_spyglass.was_using

# execute as @a run function echo_spyglass:use