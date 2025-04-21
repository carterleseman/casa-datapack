# capture items pushed into grate
execute positioned ~ ~.499 ~ if entity @e[type=minecraft:item,distance=..0.5,limit=1] run return run ride @e[type=minecraft:item,distance=..0.5,limit=1] mount @s
# capture items resting on top of grate with a downward bubble column
execute if score @s copper_pipes.bubble_column_down matches 1 positioned ~ ~1 ~ at @e[type=minecraft:item,distance=..1,limit=1,nbt={OnGround:true,Motion: [0d,0d,0d]}] if block ~ ~-1 ~ #copper_pipes:copper_grate run return run ride @n[type=minecraft:item,limit=1,nbt={OnGround:true}] mount @s