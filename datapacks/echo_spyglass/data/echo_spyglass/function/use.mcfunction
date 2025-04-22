advancement revoke @s only echo_spyglass:use_spyglass

team join echo_spyglass.using @s

tag @s add echo_spyglass.using
effect give @s minecraft:blindness infinite 1 true

execute at @s as @e[type=!minecraft:text_display, distance=2..100] if predicate { condition: "minecraft:random_chance", chance: 0.075 } at @s run function echo_spyglass:particle/summon_random { id: 0, range: 10 }
execute at @s as @e[type=!minecraft:text_display, distance=2..100] if predicate { condition: "minecraft:random_chance", chance: 0.05 } at @s run function echo_spyglass:particle/summon_random { id: 1, range: 10 }
execute at @e[type=!minecraft:text_display, distance=2..100] if predicate { condition: "minecraft:random_chance", chance: 0.01 } run playsound minecraft:block.sculk_catalyst.bloom ambient @s ~ ~ ~ 5 0.1 0.2
# execute at @s as @e[type=!minecraft:text_display, distance=2..100] if predicate { condition: "minecraft:random_chance", chance: 0.01 } run effect give @s minecraft:glowing 1 1 true

# glow entities the player looks at
execute as @e[type=!minecraft:text_display, distance=2..100] unless score @s echo_spyglass.gaze_time matches ..0 run scoreboard players remove @s echo_spyglass.gaze_time 1
execute as @e[type=!minecraft:text_display, distance=2..100] run function echo_spyglass:glow

execute unless entity @s[tag=echo_spyglass.was_using] run playsound minecraft:block.sculk.charge ambient @s ~ ~ ~ 5 0.1
tag @s remove echo_spyglass.was_using