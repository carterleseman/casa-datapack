##
 # hit.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
#ends the loop function (you could also do that with the break command in 1.20+ (in the loop) but this works)
scoreboard players set $pbroll.i pbroll.dummy 100

# shit that happens

execute if block ~ ~ ~ player_wall_head[facing=east] run function pbroll:place/roll/east
execute if block ~ ~ ~ player_head[rotation=3] run function pbroll:place/roll/east
execute if block ~ ~ ~ player_head[rotation=4] run function pbroll:place/roll/east
execute if block ~ ~ ~ player_head[rotation=5] run function pbroll:place/roll/east

execute if block ~ ~ ~ player_wall_head[facing=south] run function pbroll:place/roll/south
execute if block ~ ~ ~ player_head[rotation=7] run function pbroll:place/roll/south
execute if block ~ ~ ~ player_head[rotation=8] run function pbroll:place/roll/south
execute if block ~ ~ ~ player_head[rotation=9] run function pbroll:place/roll/south

execute if block ~ ~ ~ player_wall_head[facing=west] run function pbroll:place/roll/west
execute if block ~ ~ ~ player_head[rotation=11] run function pbroll:place/roll/west
execute if block ~ ~ ~ player_head[rotation=12] run function pbroll:place/roll/west
execute if block ~ ~ ~ player_head[rotation=13] run function pbroll:place/roll/west

execute if block ~ ~ ~ player_wall_head[facing=north] run function pbroll:place/roll/north
execute if block ~ ~ ~ player_head[rotation=0] run function pbroll:place/roll/north
execute if block ~ ~ ~ player_head[rotation=1] run function pbroll:place/roll/north
execute if block ~ ~ ~ player_head[rotation=15] run function pbroll:place/roll/north


execute if block ~ ~ ~ player_head[rotation=2] run function pbroll:place/roll/invalid_placement
execute if block ~ ~ ~ player_head[rotation=6] run function pbroll:place/roll/invalid_placement
execute if block ~ ~ ~ player_head[rotation=10] run function pbroll:place/roll/invalid_placement
execute if block ~ ~ ~ player_head[rotation=14] run function pbroll:place/roll/invalid_placement
