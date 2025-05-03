$execute positioned as @s as @n[type=#horsey:owned,distance=5..160.5,nbt={Tame:1b,equipment:{saddle:{id:"minecraft:saddle"}},Owner:$(plr_uuid)}] run tag @s add horsey.target
execute as @n[type=#horsey:tamed,distance=5..160.5,nbt={Tame:1b,equipment:{saddle:{id:"minecraft:saddle"}}}] unless entity @e[tag=horsey.target] run tag @s add horsey.target
execute as @n[type=#horsey:stick,distance=5..160.5,nbt={equipment:{saddle:{id:"minecraft:saddle"}}}] unless entity @e[tag=horsey.target] run tag @s add horsey.target

execute as @n[tag=horsey.target] run function horsey:trumpet/type
execute as @s at @s if entity @e[tag=horsey.target] run function horsey:trumpet/sound
execute as @n[tag=horsey.target] run function horsey:trumpet/effect

tag @e[tag=horsey.target] remove horsey.target
tag @s remove horsey.owner