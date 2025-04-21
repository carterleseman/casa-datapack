schedule function main:handler/player/triggers 1t

# --------------------------------------------------------------------------------- #

execute if score #fog ThePaleGardenRemastered matches 1 run return run scoreboard players set #fog ThePaleGardenRemastered 0
execute if score #fog ThePaleGardenRemastered matches 0 run return run scoreboard players set #fog ThePaleGardenRemastered 1