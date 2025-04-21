# a gold arrow shoots with more accuracy.
# the game randomly applies an offset to the arrow's motion when it's shot.
# we need to override it when it first spawns to shoot exactly where the player pointed

execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"gold"}}}},tag=!fletching_table.arrow_gold] at @s run function fletching_table:arrows/gold_setup
execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"gold"}}}}] run data modify entity @s SoundEvent set value "minecraft:item.trident.hit_ground"