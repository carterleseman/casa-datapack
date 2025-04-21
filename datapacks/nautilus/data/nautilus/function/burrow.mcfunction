setblock ~ ~ ~ minecraft:suspicious_gravel
damage @s 0 minecraft:generic
data modify entity @s HurtByTimestamp set value 0
data modify entity @s HurtTime set value 0s
data modify entity @s DeathLootTable set value "minecraft:empty"
data modify block ~ ~ ~ item set value { id: "minecraft:nautilus_shell", components: { "minecraft:custom_data": {nautilus: true}, "minecraft:item_model": "nautilus:nautilus" } }

playsound minecraft:item.brush.brushing.gravel.complete neutral @a ~ ~ ~
playsound minecraft:entity.shulker.close neutral @a ~ ~ ~

particle minecraft:block{block_state:{Name:"minecraft:gravel"}} ~ ~ ~ 0 0 0 0.1 10

execute on passengers run kill @s
# kill any XP orbs spawned by this death
kill @s
execute at @s run kill @e[type=minecraft:experience_orb,distance=..1]