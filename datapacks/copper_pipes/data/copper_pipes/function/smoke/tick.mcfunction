execute as @e[type=minecraft:item_display,tag=copper_pipes.grate] at @s run function copper_pipes:smoke/tick_grate
execute as @e[type=minecraft:item_display,tag=copper_pipes.grate] unless score @s copper_pipes.smoke matches 0 at @s positioned ~ ~1 ~ run function copper_pipes:smoke/tick_damage
execute as @e[type=minecraft:item_display,tag=copper_pipes.grate] unless score @s copper_pipes.smoke matches 0 at @s positioned ~ ~0.5 ~ run function copper_pipes:smoke/tick_particles

schedule function copper_pipes:smoke/tick 8t replace