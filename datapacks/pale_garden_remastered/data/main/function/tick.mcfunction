execute as @a at @s run function main:handler/player/main
execute as @a if score @s ThePaleGardenRemastered matches 1.. run function main:handler/player/triggers

execute as @e[type=creaking] at @s run function main:handler/ai/main

# --------------------------------------------------------------------------------- #

function main:handler/timers