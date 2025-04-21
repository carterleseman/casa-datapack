schedule function main:handler/player/triggers 1t

# --------------------------------------------------------------------------------- #

execute if score #creaking_variants ThePaleGardenRemastered matches 1 run return run scoreboard players set #creaking_variants ThePaleGardenRemastered 0
execute if score #creaking_variants ThePaleGardenRemastered matches 0 run return run scoreboard players set #creaking_variants ThePaleGardenRemastered 1