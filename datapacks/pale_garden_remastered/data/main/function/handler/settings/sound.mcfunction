schedule function main:handler/player/triggers 1t

# --------------------------------------------------------------------------------- #

execute if score #sound ThePaleGardenRemastered matches 1 run return run scoreboard players set #sound ThePaleGardenRemastered 0
execute if score #sound ThePaleGardenRemastered matches 0 run return run scoreboard players set #sound ThePaleGardenRemastered 1