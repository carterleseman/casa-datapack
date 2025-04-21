# if the player closes the fletching table gui, give them their items back
# execute if block ~ ~ ~ minecraft:barrel[open=false] run function fletching_table:gui/lock_slot { slot: 0, item: "minecraft:air", count: 1 }
# execute if block ~ ~ ~ minecraft:barrel[open=false] run function fletching_table:gui/lock_slot { slot: 5, item: "minecraft:air", count: 1 }
# execute if block ~ ~ ~ minecraft:barrel[open=false] run function fletching_table:gui/lock_slot { slot: 6, item: "minecraft:air", count: 1 }
# execute if block ~ ~ ~ minecraft:barrel[open=false] run function fletching_table:gui/lock_slot { slot: 9, item: "minecraft:air", count: 1 }

# execute if block ~ ~ ~ minecraft:barrel[open=false] run function fletching_table:gui/lock_slot { slot: 13, item: "minecraft:air", count: 1 }
# execute if block ~ ~ ~ minecraft:barrel[open=false] run function fletching_table:gui/lock_slot { slot: 15, item: "minecraft:air", count: 1 }

# execute if block ~ ~ ~ minecraft:barrel[open=false] run function fletching_table:gui/lock_slot { slot: 18, item: "minecraft:air", count: 1 }
# execute if block ~ ~ ~ minecraft:barrel[open=false] run function fletching_table:gui/lock_slot { slot: 23, item: "minecraft:air", count: 1 }
# execute if block ~ ~ ~ minecraft:barrel[open=false] run function fletching_table:gui/lock_slot { slot: 24, item: "minecraft:air", count: 1 }
# execute if block ~ ~ ~ minecraft:barrel[open=false] run function fletching_table:gui/lock_slot { slot: 27, item: "minecraft:air", count: 1 }
# execute if block ~ ~ ~ minecraft:barrel[open=false] run function fletching_table:gui/lock_slot { slot: 28, item: "minecraft:air", count: 1 }
# execute if block ~ ~ ~ minecraft:barrel[open=false] run function fletching_table:gui/lock_slot { slot: 29, item: "minecraft:air", count: 1 }

# prevent crafting from occurring
scoreboard players set @s fletching_table.prev_arrows_crafting 0
scoreboard players set @s fletching_table.prev_bows_crafting 0
scoreboard players set @s fletching_table.arrows_crafting 0
scoreboard players set @s fletching_table.bows_crafting 0
item replace block ~ ~ ~ container.11 with minecraft:air
item replace block ~ ~ ~ container.17 with minecraft:air

# input/output slots
function fletching_table:gui/lock_slot { slot: 0, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 5, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 6, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 9, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 11, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 13, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 15, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 17, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 18, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 23, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 24, item: "minecraft:air", count: 1 }

# gui slots
data remove storage fletching_table:lock_slot give_extras
function fletching_table:gui/lock_slot { slot: 1, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 2, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 3, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 4, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 7, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 8, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 10, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 12, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 14, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 16, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 19, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 20, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 21, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 22, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 25, item: "minecraft:air", count: 1 }
function fletching_table:gui/lock_slot { slot: 26, item: "minecraft:air", count: 1 }
data modify storage fletching_table:lock_slot give_extras set value true