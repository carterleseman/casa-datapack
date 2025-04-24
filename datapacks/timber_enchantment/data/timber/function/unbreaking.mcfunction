scoreboard players set #ub tmbr.tmp 0

execute store result score #ub tmbr.tmp run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:unbreaking"

# 100 / (level + 1) is the chance in % for the item to reduce durability.

scoreboard players add #ub tmbr.tmp 1
scoreboard players set #ubc tmbr.tmp 100
scoreboard players operation #ubc tmbr.tmp /= #ub tmbr.tmp

# #ubc is now the % chance that the item reduces useability (100 / 50 / 33 / 25 / etc).