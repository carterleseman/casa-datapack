execute as @e[tag=barrier] run scoreboard players set @s particle 0
execute as @e[tag=barrier] run scoreboard players set @s particle2 0
execute as @e[tag=barrier] at @s positioned ~ ~.5 ~ run function harderdrag:particles/particlesphere

schedule function harderdrag:particles/particletick 10t