tag @s add deathRow
execute if entity @s[tag=!snowy] run function owls:summon/default
execute if entity @s[tag=snowy] run function owls:summon/snowy
# data modify entity @e[type=allay,tag=!deathRow,tag=owl,limit=1,sort=nearest] HandItems set from entity @s HandItems
data modify entity @e[type=allay,tag=!deathRow,tag=owl,limit=1,sort=nearest] equipment.mainhand set from entity @s equipment.mainhand
data modify entity @e[type=allay,tag=!deathRow,tag=owl,limit=1,sort=nearest] equipment.offhand set from entity @s equipment.offhand
data modify entity @e[type=allay,tag=!deathRow,tag=owl,limit=1,sort=nearest] Tags set from entity @s Tags
data merge entity @s {DeathLootTable:"minecraft:entities/lol",equipment:{mainhand:{id:"minecraft:air"},offhand:{id:"minecraft:air"}},Inventory:[{id:"minecraft:air"}]}
kill @s
