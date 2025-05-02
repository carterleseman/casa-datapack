tag @s add waiting
data modify storage horsey:main plr_uuid set from entity @s UUID

schedule function horsey:trumpet/ready-wait 2.5s
schedule function horsey:trumpet/reset-wait 7s