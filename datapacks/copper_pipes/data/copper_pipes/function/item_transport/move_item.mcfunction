# move to adjacent pipe with a lower water level than @s
execute positioned ~-1 ~ ~ if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.water < @s copper_pipes.water run return run function copper_pipes:item_transport/transfer_item

execute positioned ~1 ~ ~ if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.water < @s copper_pipes.water run return run function copper_pipes:item_transport/transfer_item

execute positioned ~ ~ ~-1 if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.water < @s copper_pipes.water run return run function copper_pipes:item_transport/transfer_item

execute positioned ~ ~ ~1 if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.water < @s copper_pipes.water run return run function copper_pipes:item_transport/transfer_item

# bubble columns
execute positioned ~ ~1 ~ if score @s copper_pipes.bubble_column_up matches 1 if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.water >= @s copper_pipes.water run return run function copper_pipes:item_transport/transfer_item
execute positioned ~ ~-1 ~ if score @s copper_pipes.bubble_column_down matches 1 if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.water >= @s copper_pipes.water run return run function copper_pipes:item_transport/transfer_item
execute positioned ~ ~1 ~ if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.bubble_column_up matches 1 run return run function copper_pipes:item_transport/transfer_item
execute positioned ~ ~-1 ~ if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.bubble_column_down matches 1 run return run function copper_pipes:item_transport/transfer_item

# eject items when reached end

ride @e[type=minecraft:item,distance=..0.01,limit=1] dismount
playsound minecraft:entity.item_frame.remove_item block @a ~ ~ ~
scoreboard players set @e[type=minecraft:item,distance=..0.01,limit=1] copper_pipes.transfer_distance 0

execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~-1 ~ ~ #minecraft:air if block ~1 ~ ~ #copper_pipes:copper_grate run data modify entity @s Motion set value [-0.2d, 0d, 0d]
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~-1 ~ ~ #minecraft:air if block ~1 ~ ~ #copper_pipes:copper_grate run return run tp @s ~-1.125 ~ ~
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~1 ~ ~ #minecraft:air if block ~-1 ~ ~ #copper_pipes:copper_grate run data modify entity @s Motion set value [0.2d, 0d, 0d]
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~1 ~ ~ #minecraft:air if block ~-1 ~ ~ #copper_pipes:copper_grate run return run tp @s ~1.125 ~ ~

execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~ ~-1 #minecraft:air if block ~ ~ ~1 #copper_pipes:copper_grate run data modify entity @s Motion set value [0d, 0d, -0.2d]
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~ ~-1 #minecraft:air if block ~ ~ ~1 #copper_pipes:copper_grate run return run tp @s ~ ~ ~-1.125
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~ ~1 #minecraft:air if block ~ ~ ~-1 #copper_pipes:copper_grate run data modify entity @s Motion set value [0d, 0d, 0.2d]
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~ ~1 #minecraft:air if block ~ ~ ~-1 #copper_pipes:copper_grate run return run tp @s ~ ~ ~1.125

execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~-1 ~ #minecraft:air if block ~ ~1 ~ #copper_pipes:copper_grate run data modify entity @s Motion set value [0d, -0.2d, 0d]
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~-1 ~ #minecraft:air if block ~ ~1 ~ #copper_pipes:copper_grate run return run tp @s ~ ~-1.125 ~
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~1 ~ #minecraft:air if block ~ ~-1 ~ #copper_pipes:copper_grate run data modify entity @s Motion set value [0d, 5d, 0d]
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~1 ~ #minecraft:air if block ~ ~-1 ~ #copper_pipes:copper_grate run return run tp @s ~ ~1.125 ~

execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~-1 ~ ~ #minecraft:air run data modify entity @s Motion set value [-0.2d, 0.0d, 0.0d]
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~-1 ~ ~ #minecraft:air run return run tp @s ~-1.125 ~ ~
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~1 ~ ~ #minecraft:air run data modify entity @s Motion set value [0.2d, 0d, 0d]
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~1 ~ ~ #minecraft:air run return run tp @s ~1.125 ~ ~

execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~ ~-1 #minecraft:air run data modify entity @s Motion set value [0d, 0d, -0.2d]
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~ ~-1 #minecraft:air run return run tp @s ~ ~ ~-1.125
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~ ~1 #minecraft:air run data modify entity @s Motion set value [0d, 0d, 0.2d]
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~ ~1 #minecraft:air run return run tp @s ~ ~ ~1.125

execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~-1 ~ #minecraft:air run data modify entity @s Motion set value [0d, -0.2d, 0d]
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~-1 ~ #minecraft:air run return run tp @s ~ ~-1.125 ~
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~1 ~ #minecraft:air run data modify entity @s Motion set value [0d, 5d, 0d]
execute at @s as @e[type=minecraft:item,distance=..0.01,limit=1] if block ~ ~1 ~ #minecraft:air run return run tp @s ~ ~1.125 ~