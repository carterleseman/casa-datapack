# reset crafting success status
execute store result score @s fletching_table.prev_bows_crafting run scoreboard players get @s fletching_table.bows_crafting
scoreboard players set @s fletching_table.bows_crafting 0

# try each arrow recipe until one succeeds
execute unless score @s fletching_table.bows_crafting matches 1.. store result score @s fletching_table.bows_crafting run function fletching_table:recipes/bows/bone
execute unless score @s fletching_table.bows_crafting matches 1.. store result score @s fletching_table.bows_crafting run function fletching_table:recipes/bows/bow
execute unless score @s fletching_table.bows_crafting matches 1.. store result score @s fletching_table.bows_crafting run function fletching_table:recipes/bows/elite_power
execute unless score @s fletching_table.bows_crafting matches 1.. store result score @s fletching_table.bows_crafting run function fletching_table:recipes/bows/twisting_vines
execute unless score @s fletching_table.bows_crafting matches 1.. store result score @s fletching_table.bows_crafting run function fletching_table:recipes/bows/void
execute unless score @s fletching_table.bows_crafting matches 1.. store result score @s fletching_table.bows_crafting run function fletching_table:recipes/bows/weeping_vines
execute unless score @s fletching_table.bows_crafting matches 1.. store result score @s fletching_table.bows_crafting run function fletching_table:recipes/bows/wind

# if crafting failed, but succeeded before, they removed an ingredient.
# clear the result slot without giving the item
execute if score @s fletching_table.bows_crafting matches 0 if score @s fletching_table.prev_bows_crafting matches 1.. run item replace block ~ ~ ~ container.17 with minecraft:air
execute if score @s fletching_table.bows_crafting matches 0 if score @s fletching_table.prev_bows_crafting matches 0 run function fletching_table:gui/lock_slot { slot: 17, item: "minecraft:air", count: 1 }