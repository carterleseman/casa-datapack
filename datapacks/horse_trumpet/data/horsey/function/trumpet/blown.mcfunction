advancement revoke @s only horsey:blown
data modify storage horsey:main plr_uuid set from entity @s UUID
tag @s add horsey.owner
scoreboard players set @s horsey.timer 1