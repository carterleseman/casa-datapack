execute as @e[type=minecraft:item_display,tag=copper_pipes.grate,nbt={Passengers:[{id:"minecraft:item"}]}] at @s run function copper_pipes:item_transport/move_item

# items only update every 8 ticks
schedule function copper_pipes:item_transport/tick 4t replace