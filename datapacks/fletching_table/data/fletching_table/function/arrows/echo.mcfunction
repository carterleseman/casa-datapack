scoreboard players add @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"echo"}}}, inGround: false}] fletching_table.echo_arrow_lifetime 1

execute as @e[type=minecraft:arrow,nbt={item:{components:{"minecraft:custom_data":{fletching_table_arrow:"echo"}}}, inGround: false}] at @s run function fletching_table:arrows/echo_direction