# if an arrow shot by a wind bow hits an entity (with crit), summon a wind charge under it

advancement revoke @s only fletching_table:wind_bow

tag @s add fletching_table.bow_attacker
execute as @e[nbt={HurtTime:10s}] if function fletching_table:bows/check_attacker at @s run summon minecraft:wind_charge ~ ~ ~ { Motion: [0d, -1d, 0d] }
tag @s remove fletching_table.bow_attacker