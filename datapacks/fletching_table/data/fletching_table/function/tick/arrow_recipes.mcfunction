# reset crafting success status
execute store result score @s fletching_table.prev_arrows_crafting run scoreboard players get @s fletching_table.arrows_crafting
scoreboard players set @s fletching_table.arrows_crafting 0

# try each arrow recipe until one succeeds
execute unless score @s fletching_table.arrows_crafting matches 1.. store result score @s fletching_table.arrows_crafting run function fletching_table:recipes/amethyst_arrow
execute unless score @s fletching_table.arrows_crafting matches 1.. store result score @s fletching_table.arrows_crafting run function fletching_table:recipes/arrow
execute unless score @s fletching_table.arrows_crafting matches 1.. store result score @s fletching_table.arrows_crafting run function fletching_table:recipes/gold_arrow
execute unless score @s fletching_table.arrows_crafting matches 1.. store result score @s fletching_table.arrows_crafting run function fletching_table:recipes/iron_arrow
execute unless score @s fletching_table.arrows_crafting matches 1.. store result score @s fletching_table.arrows_crafting run function fletching_table:recipes/prismarine_arrow
execute unless score @s fletching_table.arrows_crafting matches 1.. store result score @s fletching_table.arrows_crafting run function fletching_table:recipes/slime_arrow
execute unless score @s fletching_table.arrows_crafting matches 1.. store result score @s fletching_table.arrows_crafting run function fletching_table:recipes/torch_arrow
execute unless score @s fletching_table.arrows_crafting matches 1.. store result score @s fletching_table.arrows_crafting run function fletching_table:recipes/echo_arrow

# if crafting failed, but succeeded before, they removed an ingredient.
# clear the result slot without giving the item
execute if score @s fletching_table.arrows_crafting matches 0 if score @s fletching_table.prev_arrows_crafting matches 1.. run item replace block ~ ~ ~ container.11 with minecraft:air
execute if score @s fletching_table.arrows_crafting matches 0 if score @s fletching_table.prev_arrows_crafting matches 0 run function fletching_table:gui/lock_slot { slot: 11, item: "minecraft:air", count: 1 }