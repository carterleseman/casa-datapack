execute positioned as @p[tag=horsey.owner] as @n[type=#horsey:owned,distance=5..,nbt={Tame:1b,equipment:{saddle:{id:"minecraft:saddle"}}}] if function horsey:trumpet/if/owner run tag @s add horsey.target

execute positioned as @p[tag=horsey.owner] as @n[type=#horsey:tamed,distance=5..,nbt={Tame:1b,equipment:{saddle:{id:"minecraft:saddle"}}}] unless entity @e[tag=horsey.target] run tag @s add horsey.target

execute as @n[tag=horsey.target] run function horsey:trumpet/type
execute as @p[tag=horsey.owner] at @s if entity @e[tag=horsey.target] run function horsey:trumpet/sound
execute as @n[tag=horsey.target] run function horsey:trumpet/effect

tag @e[tag=horsey.target] remove horsey.target
tag @p[tag=horsey.owner] remove horsey.owner