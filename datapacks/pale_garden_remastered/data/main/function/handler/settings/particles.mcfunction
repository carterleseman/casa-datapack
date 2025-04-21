schedule function main:handler/player/triggers 1t

# --------------------------------------------------------------------------------- #

execute if score #particles ThePaleGardenRemastered matches 1 run return run scoreboard players set #particles ThePaleGardenRemastered 0
execute if score #particles ThePaleGardenRemastered matches 0 run return run scoreboard players set #particles ThePaleGardenRemastered 1