clear @a minecraft:barrier[minecraft:custom_data={fletching_table_gui:true}]
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:barrier",components:{"minecraft:custom_data":{fletching_table_gui:true}}}}]
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:barrel",components:{"minecraft:custom_data":{fletching_table:true}}}}]

execute as @e[type=minecraft:block_display,tag=fletching_table] at @s align xyz positioned ~ ~-1 ~ run function fletching_table:tick/gui

function fletching_table:tick/arrows
function fletching_table:tick/bows