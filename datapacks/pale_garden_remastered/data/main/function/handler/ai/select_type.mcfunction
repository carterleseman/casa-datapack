tag @s add PGR

# --------------------------------------------------------------------------------- #

execute store result score #type Creaking run random value 1..3

# --------------------------------------------------------------------------------- #

# The Baby Creaking
execute if score #type Creaking matches 1 run attribute @s scale base set 0.7
execute if score #type Creaking matches 1 run attribute @s attack_damage base set 2
execute if score #type Creaking matches 1 run attribute @s movement_speed base set 0.4
execute if score #type Creaking matches 1 run attribute @s max_health base set 10
execute if score #type Creaking matches 1 run data modify entity @s Health set value 10.0f

# The Creaking
execute if score #type Creaking matches 2 run attribute @s scale base set 1
execute if score #type Creaking matches 2 run attribute @s attack_damage base set 3
execute if score #type Creaking matches 2 run attribute @s movement_speed base set 0.8
execute if score #type Creaking matches 2 run attribute @s max_health base set 20
execute if score #type Creaking matches 2 run data modify entity @s Health set value 20.0f

# The Elder Creaking
execute if score #type Creaking matches 3 run attribute @s scale base set 1.5
execute if score #type Creaking matches 3 run attribute @s attack_damage base set 4.5
execute if score #type Creaking matches 3 run attribute @s movement_speed base set 1.2
execute if score #type Creaking matches 3 run attribute @s max_health base set 40
execute if score #type Creaking matches 3 run data modify entity @s Health set value 40.0f

# --------------------------------------------------------------------------------- #

execute as @s[tag=PGR.Special] run return fail
execute if score #creaking_variants ThePaleGardenRemastered matches 0 run return fail

# --------------------------------------------------------------------------------- #

# Random roll for extra creaking spawns
execute store result score #random Creaking run random value 1..8

execute if score #random Creaking matches 1..4 summon creaking run tag @s add PGR.Special
execute if score #random Creaking matches 1..2 summon creaking run tag @s add PGR.Special