scoreboard players set #max tmbr.tmp 0
scoreboard players set #dmg tmbr.tmp 0
execute store result score #max tmbr.tmp run data get entity @s SelectedItem.components."minecraft:max_damage"
execute store result score #dmg tmbr.tmp run data get entity @s SelectedItem.components."minecraft:damage"

scoreboard players operation #tmp tmbr.tmp = #max tmbr.tmp

execute if score #max tmbr.tmp matches 1.. run return run scoreboard players operation #tmp tmbr.tmp -= #dmg tmbr.tmp

execute if items entity @s weapon.mainhand wooden_axe run scoreboard players set #max tmbr.tmp 59
execute if items entity @s weapon.mainhand stone_axe run scoreboard players set #max tmbr.tmp 131
execute if items entity @s weapon.mainhand iron_axe run scoreboard players set #max tmbr.tmp 250
execute if items entity @s weapon.mainhand diamond_axe run scoreboard players set #max tmbr.tmp 1561
execute if items entity @s weapon.mainhand golden_axe run scoreboard players set #max tmbr.tmp 32
execute if items entity @s weapon.mainhand netherite_axe run scoreboard players set #max tmbr.tmp 2031

scoreboard players operation #tmp tmbr.tmp = #max tmbr.tmp
return run scoreboard players operation #tmp tmbr.tmp -= #dmg tmbr.tmp