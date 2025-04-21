execute store result score @s copper_pipes.prev_water run scoreboard players get @s copper_pipes.water

# if waterlogged => 7
execute if block ~ ~ ~ #copper_pipes:copper_grate[waterlogged=true] run scoreboard players set @s copper_pipes.water 8
execute if block ~ ~ ~ #copper_pipes:copper_grate[waterlogged=true] if score @s copper_pipes.prev_water = @s copper_pipes.water run return run scoreboard players set @s copper_pipes.level_changed 0
execute if block ~ ~ ~ #copper_pipes:copper_grate[waterlogged=true] unless score @s copper_pipes.prev_water = @s copper_pipes.water run return run scoreboard players set @s copper_pipes.level_changed 1

# if block above has any water => 7
execute positioned ~ ~1 ~ if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.level_changed matches 0 unless score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.water matches 0 run scoreboard players set @s copper_pipes.water 8
execute positioned ~ ~1 ~ if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.level_changed matches 0 unless score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.water matches 0 if score @s copper_pipes.prev_water = @s copper_pipes.water run return run scoreboard players set @s copper_pipes.level_changed 0
execute positioned ~ ~1 ~ if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.level_changed matches 0 unless score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.water matches 0 unless score @s copper_pipes.prev_water = @s copper_pipes.water run return run scoreboard players set @s copper_pipes.level_changed 1

# if block next to has any water => level - 1
scoreboard players set @s copper_pipes.water_comp_0 0
scoreboard players set @s copper_pipes.water_comp_1 0
execute positioned ~1 ~ ~ if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.level_changed matches 0 if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.water > @s copper_pipes.one run function copper_pipes:water/diminish_level
execute if score @s copper_pipes.water_comp_1 > @s copper_pipes.water_comp_0 store result score @s copper_pipes.water_comp_0 run scoreboard players get @s copper_pipes.water_comp_1
execute positioned ~-1 ~ ~ if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.level_changed matches 0 if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.water > @s copper_pipes.one run function copper_pipes:water/diminish_level
execute if score @s copper_pipes.water_comp_1 > @s copper_pipes.water_comp_0 store result score @s copper_pipes.water_comp_0 run scoreboard players get @s copper_pipes.water_comp_1
execute positioned ~ ~ ~1 if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.level_changed matches 0 if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.water > @s copper_pipes.one run function copper_pipes:water/diminish_level
execute if score @s copper_pipes.water_comp_1 > @s copper_pipes.water_comp_0 store result score @s copper_pipes.water_comp_0 run scoreboard players get @s copper_pipes.water_comp_1
execute positioned ~ ~ ~-1 if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.level_changed matches 0 if score @e[type=minecraft:item_display,tag=copper_pipes.grate,distance=..0.01,limit=1] copper_pipes.water > @s copper_pipes.one run function copper_pipes:water/diminish_level
execute if score @s copper_pipes.water_comp_1 > @s copper_pipes.water_comp_0 store result score @s copper_pipes.water_comp_0 run scoreboard players get @s copper_pipes.water_comp_1

execute if score @s copper_pipes.water_comp_0 > @s copper_pipes.zero store result score @s copper_pipes.water run scoreboard players get @s copper_pipes.water_comp_0
execute if score @s copper_pipes.water_comp_0 > @s copper_pipes.zero if score @s copper_pipes.prev_water = @s copper_pipes.water run return run scoreboard players set @s copper_pipes.level_changed 0
execute if score @s copper_pipes.water_comp_0 > @s copper_pipes.zero unless score @s copper_pipes.prev_water = @s copper_pipes.water run return run scoreboard players set @s copper_pipes.level_changed 1

# reset if other conditions are not true
scoreboard players set @s copper_pipes.water 0
execute if score @s copper_pipes.prev_water = @s copper_pipes.water run return run scoreboard players set @s copper_pipes.level_changed 0
execute unless score @s copper_pipes.prev_water = @s copper_pipes.water run return run scoreboard players set @s copper_pipes.level_changed 1