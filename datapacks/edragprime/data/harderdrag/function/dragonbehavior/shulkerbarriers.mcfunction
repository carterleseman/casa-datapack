execute as @e[tag=barrier] at @s unless entity @e[type=ender_dragon,distance=..400] run kill @s
execute if entity @e[tag=barrier] as @e[type=ender_dragon] run data merge entity @s {Invulnerable:1b}
execute unless entity @e[tag=barrier] as @e[type=ender_dragon] run data merge entity @s {Invulnerable:0b}

execute as @e[type=ender_dragon] run scoreboard players set @s particle 0
execute as @e[type=ender_dragon] run scoreboard players set @s particle2 0
execute if entity @e[tag=barrier] as @e[type=ender_dragon] at @s positioned ~ ~2.5 ~ positioned ^ ^ ^-1 rotated ~ ~-75 run function harderdrag:particles/particlespheredragon

execute as @e[tag=barrier,type=shulker,nbt={HurtTime:9s}] at @s run playsound block.respawn_anchor.set_spawn master @a ~ ~ ~ 100 1 1
execute as @e[tag=barrier,type=shulker,nbt={HurtTime:9s}] on attacker run damage @e[type=ender_dragon,limit=1] 10 generic_kill by @s
execute as @e[tag=barrier,type=shulker,nbt={HurtTime:9s}] at @s run kill @s

#Detect Shulker Death

execute at @e[tag=shulkerdeathdetector] unless entity @e[tag=barrier,distance=..1] run kill @e[type=item,nbt={Item:{id:"minecraft:shulker_shell"}},distance=..2]
execute at @e[tag=shulkerdeathdetector] unless entity @e[tag=barrier,distance=..1] run kill @e[type=experience_orb,distance=..2]
execute as @e[tag=shulkerdeathdetector] at @s unless entity @e[tag=barrier,distance=..1] run kill @s

#Kill Excess

execute if score shulkercount rando > maxbarriers settings run kill @e[type=shulker,tag=barrier]