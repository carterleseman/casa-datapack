execute as @p[tag=horsey.owner] at @s if entity @e[tag=horsey.target] run function horsey:trumpet/sound
execute positioned as @p[tag=horsey.owner] as @n[tag=horsey.target] run function horsey:trumpet/effect

tag @e[tag=horsey.target] remove horsey.target
tag @p[tag=horsey.owner] remove horsey.owner