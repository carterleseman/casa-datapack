schedule function main:handler/player/triggers 1t

# --------------------------------------------------------------------------------- #

execute if score #rain ThePaleGardenRemastered matches 1 run return run scoreboard players set #rain ThePaleGardenRemastered 0
execute if score #rain ThePaleGardenRemastered matches 0 run return run scoreboard players set #rain ThePaleGardenRemastered 1