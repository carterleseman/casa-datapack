# when destroyed, drop a fletching table not a barrel
execute unless block ~ ~ ~ minecraft:barrel run data modify entity @n[type=minecraft:item,nbt={Item:{id:"minecraft:barrel",components:{"minecraft:custom_name":'"Fletching Table"'}}}] Item set value { id: "minecraft:fletching_table" }
execute unless block ~ ~ ~ minecraft:barrel run kill @s

execute if block ~ ~ ~ minecraft:barrel[open=true] run function fletching_table:gui/tick_open
execute if block ~ ~ ~ minecraft:barrel[open=false] run function fletching_table:gui/tick_closed