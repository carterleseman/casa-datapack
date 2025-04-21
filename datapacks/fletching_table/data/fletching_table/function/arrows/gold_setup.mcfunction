# replicates the motion logic of an arrow as described in the wiki
# we create a vector based on the players look direction (raycast)
# then multiply it by the speed of the original arrow motion vector

tag @s add fletching_table.arrow_gold

# get the start position
execute as @p store result score #x fletching_table.gold_arrow run data get entity @s Pos[0] 1000
execute as @p store result score #y fletching_table.gold_arrow run data get entity @s Pos[1] 1000
execute as @p store result score #z fletching_table.gold_arrow run data get entity @s Pos[2] 1000

# get the raycast position
execute as @p at @s positioned ^ ^ ^1 run summon minecraft:marker ~ ~ ~ {Tags:["fletching_table.arrow_gold_ray"]}
execute store result score #x2 fletching_table.gold_arrow run data get entity @n[type=minecraft:marker,tag=fletching_table.arrow_gold_ray] Pos[0] 1000
execute store result score #y2 fletching_table.gold_arrow run data get entity @n[type=minecraft:marker,tag=fletching_table.arrow_gold_ray] Pos[1] 1000
execute store result score #z2 fletching_table.gold_arrow run data get entity @n[type=minecraft:marker,tag=fletching_table.arrow_gold_ray] Pos[2] 1000

# calculate the normalized motion vector
scoreboard players operation #x2 fletching_table.gold_arrow -= #x fletching_table.gold_arrow
scoreboard players operation #y2 fletching_table.gold_arrow -= #y fletching_table.gold_arrow
scoreboard players operation #z2 fletching_table.gold_arrow -= #z fletching_table.gold_arrow

# calculate the speed (original vector / normalized vector)
execute store result score #vx fletching_table.gold_arrow run data get entity @s Motion[0] 1000000
execute store result score #vy fletching_table.gold_arrow run data get entity @s Motion[1] 1000000
execute store result score #vz fletching_table.gold_arrow run data get entity @s Motion[2] 1000000

scoreboard players operation #vx fletching_table.gold_arrow /= #x2 fletching_table.gold_arrow
scoreboard players operation #vy fletching_table.gold_arrow /= #y2 fletching_table.gold_arrow
scoreboard players operation #zy fletching_table.gold_arrow /= #z2 fletching_table.gold_arrow

scoreboard players set #3 fletching_table.gold_arrow 3000
execute store result score #speed fletching_table.gold_arrow run scoreboard players get #vx fletching_table.gold_arrow
# scoreboard players operation #score fletching_table.gold_arrow += #vy fletching_table.gold_arrow
# scoreboard players operation #score fletching_table.gold_arrow += #vz fletching_table.gold_arrow
# scoreboard players operation #score fletching_table.gold_arrow /= #3 fletching_table.gold_arrow
execute if score #vy fletching_table.gold_arrow > #speed fletching_table.gold_arrow store result score #score fletching_table.gold_arrow run scoreboard players get #vy fletching_table.gold_arrow
execute if score #vz fletching_table.gold_arrow > #speed fletching_table.gold_arrow store result score #score fletching_table.gold_arrow run scoreboard players get #vz fletching_table.gold_arrow
execute if score #speed fletching_table.gold_arrow > #3 fletching_table.gold_arrow run scoreboard players set #speed fletching_table.gold_arrow 3000

# apply speed to normalized motion vector
scoreboard players operation #x2 fletching_table.gold_arrow *= #speed fletching_table.gold_arrow
scoreboard players operation #y2 fletching_table.gold_arrow *= #speed fletching_table.gold_arrow
scoreboard players operation #z2 fletching_table.gold_arrow *= #speed fletching_table.gold_arrow

# apply motion to arrow
execute store result entity @s Motion[0] double 0.000001 run scoreboard players get #x2 fletching_table.gold_arrow
execute store result entity @s Motion[1] double 0.000001 run scoreboard players get #y2 fletching_table.gold_arrow
execute store result entity @s Motion[2] double 0.000001 run scoreboard players get #z2 fletching_table.gold_arrow

kill @e[type=minecraft:marker,tag=fletching_table.arrow_gold_ray]