tag @s add echo_spyglass.target

execute if score @s echo_spyglass.gaze_time matches ..64 as @p[tag=echo_spyglass.using] at @s anchored eyes facing entity @e[tag=echo_spyglass.target] eyes anchored feet positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.1] run scoreboard players add @e[tag=echo_spyglass.target] echo_spyglass.gaze_time 2

execute if score @s echo_spyglass.gaze_time matches 64.. run effect give @e[tag=echo_spyglass.target] minecraft:glowing 1
# execute if score @s echo_spyglass.gaze_time matches 64 run playsound minecraft:block.sculk.spread ambient @p[tag=echo_spyglass.using] ~ ~ ~ 0.5 0.1 0.5
execute if score @s echo_spyglass.gaze_time matches 64 run playsound minecraft:item.spyglass.use ambient @p[tag=echo_spyglass.using] ~ ~ ~ 1 0.5 1
execute if score @s echo_spyglass.gaze_time matches 64.. run team join echo_spyglass.glow @s

# scoreboard players reset @s echo_spyglass.gaze_time
# execute store result score @s echo_spyglass.gaze_time run data get entity @s Motion[0] 10
# execute if score @s echo_spyglass.gaze_time matches 0 store result score @s echo_spyglass.gaze_time run data get entity @s Motion[1] 10
# execute if score @s echo_spyglass.gaze_time matches 0 store result score @s echo_spyglass.gaze_time run data get entity @s Motion[2] 10
# execute unless score @s echo_spyglass.gaze_time matches -1..1 run effect give @s minecraft:glowing 1
# execute unless score @s echo_spyglass.gaze_time matches -1..1 unless data entity @s active_effects[{id:"minecraft:glowing"}] run playsound minecraft:block.sculk.spread ambient @p[tag=echo_spyglass.using] ~ ~ ~ 0.5 0.1 0.5

tag @s remove echo_spyglass.target