tag @s add hungry_dripleaf.attacked
playsound minecraft:block.big_dripleaf.tilt_down hostile @a ~ ~ ~ 2 1
playsound minecraft:entity.shulker.ambient hostile @a ~ ~ ~ 0.25 2
effect give @s minecraft:poison 2 1 false
damage @s 1 minecraft:arrow

# check if we killed the mob, if so grow the plant
execute unless entity @e[tag=hungry_dripleaf.attacked] positioned ~ ~-1.005 ~ as @n[type=minecraft:interaction, tag=hungry_dripleaf, tag=!hungry_dripleaf.stem_only] run function prehistoric_mobs:hungry_dripleaf/grow
tag @s remove hungry_dripleaf.attacked