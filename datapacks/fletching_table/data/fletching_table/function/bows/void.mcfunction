# if an arrow shot by a wind bow hits an entity (with crit), summon a wind charge under it

advancement revoke @s only fletching_table:void_bow

tag @s add fletching_table.bow_attacker
execute as @e[nbt={HurtTime:10s}] if function fletching_table:bows/check_attacker at @s run playsound minecraft:item.chorus_fruit.teleport neutral @a ~ ~ ~
execute as @e[nbt={HurtTime:10s}] if function fletching_table:bows/check_attacker at @s run particle minecraft:portal ~ ~ ~ 0.5 0.5 0.5 0.2 30
execute as @e[nbt={HurtTime:10s}] if function fletching_table:bows/check_attacker at @s run spreadplayers ~ ~ 10 10 true @s
tag @s remove fletching_table.bow_attacker