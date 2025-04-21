# a copper bow will always shoot a crit arrow

execute as @e[type=minecraft:arrow,nbt={weapon:{components:{"minecraft:custom_data":{fletching_table_bow:"elite_power"}}}}] run data modify entity @s crit set value true