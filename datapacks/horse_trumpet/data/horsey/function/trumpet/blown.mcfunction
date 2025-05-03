advancement revoke @s only horsey:blown
tag @s add horsey.owner

execute positioned as @s as @n[type=#horsey:owned,distance=5..160.5,nbt={Tame:1b,equipment:{saddle:{id:"minecraft:saddle"}}}] if function horsey:trumpet/if/owner run tag @s add horsey.target
execute positioned as @s as @n[type=#horsey:tamed,distance=5..160.5,nbt={Tame:1b,equipment:{saddle:{id:"minecraft:saddle"}}}] unless entity @e[tag=horsey.target] run tag @s add horsey.target
execute positioned as @s as @n[type=#horsey:stick,distance=5..160.5,nbt={equipment:{saddle:{id:"minecraft:saddle"}}}] unless entity @e[tag=horsey.target] run tag @s add horsey.target

execute as @n[tag=horsey.target] run function horsey:trumpet/type
schedule function horsey:trumpet/reveal 2.5s