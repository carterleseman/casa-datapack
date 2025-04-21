# setup new grates
execute as @e[type=minecraft:item_display,tag=copper_pipes.new_grate,tag=copper_pipes.copper_grate] run function copper_pipes:custom_block/place { block: "minecraft:copper_grate" }
execute as @e[type=minecraft:item_display,tag=copper_pipes.new_grate,tag=copper_pipes.exposed_copper_grate] run function copper_pipes:custom_block/place { block: "minecraft:exposed_copper_grate" }
execute as @e[type=minecraft:item_display,tag=copper_pipes.new_grate,tag=copper_pipes.weathered_copper_grate] run function copper_pipes:custom_block/place { block: "minecraft:weathered_copper_grate" }
execute as @e[type=minecraft:item_display,tag=copper_pipes.new_grate,tag=copper_pipes.oxidized_copper_grate] run function copper_pipes:custom_block/place { block: "minecraft:oxidized_copper_grate" }
execute as @e[type=minecraft:item_display,tag=copper_pipes.new_grate,tag=copper_pipes.waxed_copper_grate] run function copper_pipes:custom_block/place { block: "minecraft:waxed_copper_grate" }
execute as @e[type=minecraft:item_display,tag=copper_pipes.new_grate,tag=copper_pipes.waxed_exposed_copper_grate] run function copper_pipes:custom_block/place { block: "minecraft:waxed_exposed_copper_grate" }
execute as @e[type=minecraft:item_display,tag=copper_pipes.new_grate,tag=copper_pipes.waxed_weathered_copper_grate] run function copper_pipes:custom_block/place { block: "minecraft:waxed_weathered_copper_grate" }
execute as @e[type=minecraft:item_display,tag=copper_pipes.new_grate,tag=copper_pipes.waxed_oxidized_copper_grate] run function copper_pipes:custom_block/place { block: "minecraft:waxed_oxidized_copper_grate" }

execute as @e[type=minecraft:item_display,tag=copper_pipes.new_grate] at @s align xyz run tp @s ~.5 ~ ~.5 0 0
execute as @e[type=minecraft:item_display,tag=copper_pipes.new_grate] at @s run data modify entity @s transformation.translation set value [0f, 0.5f, 0f]
execute as @e[type=minecraft:item_display,tag=copper_pipes.new_grate] at @s run playsound block.copper_grate.place block @a ~ ~ ~
scoreboard players set @e[type=minecraft:item_display,tag=copper_pipes.new_grate] copper_pipes.smoke 0
tag @e[type=minecraft:item_display,tag=copper_pipes.new_grate] add copper_pipes.grate
tag @e[type=minecraft:item_display,tag=copper_pipes.new_grate] remove copper_pipes.new_grate

# remove broken grates
execute as @e[type=minecraft:item_display,tag=copper_pipes.grate] at @s unless block ~ ~ ~ #copper_pipes:copper_grate run kill @s

# replace any dropped grates with spawn eggs.
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:copper_grate"}}] run function copper_pipes:replace_item { id: "minecraft:copper_grate", tag: "copper_pipes.copper_grate", name: "Copper Grate" }
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:exposed_copper_grate"}}] run function copper_pipes:replace_item { id: "minecraft:exposed_copper_grate", tag: "copper_pipes.exposed_copper_grate", name: "Exposed Copper Grate" }
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:weathered_copper_grate"}}] run function copper_pipes:replace_item { id: "minecraft:weathered_copper_grate", tag: "copper_pipes.weathered_copper_grate", name: "Weathered Copper Grate" }
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:oxidized_copper_grate"}}] run function copper_pipes:replace_item { id: "minecraft:oxidized_copper_grate", tag: "copper_pipes.oxidized_copper_grate", name: "Oxidized Copper Grate" }
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:waxed_copper_grate"}}] run function copper_pipes:replace_item { id: "minecraft:waxed_copper_grate", tag: "copper_pipes.waxed_copper_grate", name: "Waxed Copper Grate" }
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:waxed_exposed_copper_grate"}}] run function copper_pipes:replace_item { id: "minecraft:waxed_exposed_copper_grate", tag: "copper_pipes.waxed_exposed_copper_grate", name: "Waxed Exposed Copper Grate" }
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:waxed_weathered_copper_grate"}}] run function copper_pipes:replace_item { id: "minecraft:waxed_weathered_copper_grate", tag: "copper_pipes.waxed_weathered_copper_grate", name: "Waxed Weathered Copper Grate" }
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:waxed_oxidized_copper_grate"}}] run function copper_pipes:replace_item { id: "minecraft:waxed_oxidized_copper_grate", tag: "copper_pipes.waxed_oxidized_copper_grate", name: "Waxed Oxidized Copper Grate" }

# move items through grates
execute as @e[type=minecraft:item_display,tag=copper_pipes.grate] unless score @s copper_pipes.water matches 0 at @s unless data entity @s Passengers[0] run function copper_pipes:item_transport/capture_items
execute as @e[type=minecraft:item_display,tag=copper_pipes.grate] if data entity @s Passengers[0] at @s run particle minecraft:splash ~ ~.5 ~ 0.25 0.25 0.25 0.001 10

# bubble column particles
execute as @e[type=minecraft:item_display,tag=copper_pipes.grate] if score @s copper_pipes.bubble_column_up matches 1 at @s if block ~ ~1 ~ #minecraft:air if predicate { condition: "minecraft:random_chance", chance: 0.1 } run particle minecraft:bubble ~ ~1.1 ~ 0.2 0 0.2 0 1
execute as @e[type=minecraft:item_display,tag=copper_pipes.grate] if score @s copper_pipes.bubble_column_down matches 1 at @s if block ~ ~1 ~ #minecraft:air run particle minecraft:bubble_pop ~ ~1 ~ 0.225 0 0.225 0 1