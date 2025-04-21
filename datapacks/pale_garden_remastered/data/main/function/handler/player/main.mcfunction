execute unless biome ~ ~ ~ pale_garden run return fail

# Player Effects 
execute if score #fog ThePaleGardenRemastered matches 1 run effect give @s darkness 2 2 true


# Ambient, Player and Mob Sounds
execute if score #rain ThePaleGardenRemastered matches 1 if score #10t Timer matches 0 run playsound weather.rain weather @s
execute if score #rain ThePaleGardenRemastered matches 1 if score #20t Timer matches 0 if predicate main:rng/1p run playsound entity.lightning_bolt.thunder weather @s
execute if score #sound ThePaleGardenRemastered matches 1 if predicate main:rng/05p run playsound ambient.cave ambient @s
execute if score #sound ThePaleGardenRemastered matches 1 as @e[distance=..30, type=creaking] at @s if predicate main:rng/1p run playsound block.note_block.imitate.zombie hostile @a[distance=..30] ~ ~ ~ 1 0
execute if score #sound ThePaleGardenRemastered matches 1 if score #20t Timer matches 0 run playsound block.conduit.ambient player @s ~ ~ ~ 1 1


# Particle Effects
execute if score #rain ThePaleGardenRemastered matches 1 at @s if score #20t Timer matches 0 run particle falling_water ~ ~20 ~ 10 10 10 4 200 force
execute if score #particles ThePaleGardenRemastered matches 1 at @s run particle white_ash ~ ~20 ~ 10 10 10 4 100 force