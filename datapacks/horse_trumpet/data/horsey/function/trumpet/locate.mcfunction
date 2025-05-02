tag @e[tag=horsey.target] remove horsey.target

# prioritize owned mounts 
$execute as @n[predicate=horsey:saddle,distance=5..,nbt={Tame:1b,Owner:$(plr_uuid)}] if items entity @s saddle minecraft:saddle run tag @s add horsey.target

execute unless entity @e[tag=horsey.target] as @n[predicate=horsey:saddle,distance=5..,nbt={Tame:1b}] if items entity @s saddle minecraft:saddle run tag @s add horsey.target

# get entity type
execute as @e[tag=horsey.target] run function horsey:trumpet/type

# play sound
$execute as @p[tag=waiting,nbt={UUID:$(plr_uuid)}] positioned as @e[tag=horsey.target] run function horsey:trumpet/sound

# glow effect
execute as @e[tag=horsey.target] run function horsey:trumpet/effect