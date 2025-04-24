loot spawn ~ ~ ~ mine ~ ~ ~ mainhand
setblock ~ ~ ~ air
# check if tool reduces durability, bcs of unbreaking
execute store result score #random tmbr.tmp run random value 1..100
execute if score #random tmbr.tmp <= #ubc tmbr.tmp run scoreboard players remove #remaining tmbr.tmp 1
execute if score #remaining tmbr.tmp matches ..0 run return 0

$execute positioned ~ ~1 ~ if block ~ ~ ~ $(block) run function timber:flood_fill with storage timber:tmp
$execute positioned ~1 ~1 ~ if block ~ ~ ~ $(block) run function timber:flood_fill with storage timber:tmp
$execute positioned ~-1 ~1 ~ if block ~ ~ ~ $(block) run function timber:flood_fill with storage timber:tmp
$execute positioned ~ ~1 ~1 if block ~ ~ ~ $(block) run function timber:flood_fill with storage timber:tmp
$execute positioned ~ ~1 ~-1 if block ~ ~ ~ $(block) run function timber:flood_fill with storage timber:tmp

# diagonals
$execute positioned ~1 ~1 ~1 if block ~ ~ ~ $(block) run function timber:flood_fill with storage timber:tmp
$execute positioned ~1 ~1 ~-1 if block ~ ~ ~ $(block) run function timber:flood_fill with storage timber:tmp
$execute positioned ~-1 ~1 ~1 if block ~ ~ ~ $(block) run function timber:flood_fill with storage timber:tmp
$execute positioned ~-1 ~1 ~-1 if block ~ ~ ~ $(block) run function timber:flood_fill with storage timber:tmp