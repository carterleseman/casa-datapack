# the player took the items from $(slot)
# if this is a crafting output slot, remove the ingredients
$scoreboard players set @s fletching_table.consumed_slot $(slot)

# arrow crafting
execute if score @s fletching_table.prev_arrows_crafting matches 1.. if score @s fletching_table.consumed_slot matches 11 at @s run playsound minecraft:entity.villager.work_fletcher block @a ~ ~ ~
execute if score @s fletching_table.prev_arrows_crafting matches 1.. if score @s fletching_table.consumed_slot matches 11 run item modify block ~ ~ ~ container.0 {function:"minecraft:set_count",count:-1,add:true}
execute if score @s fletching_table.prev_arrows_crafting matches 1.. if score @s fletching_table.consumed_slot matches 11 run item modify block ~ ~ ~ container.9 {function:"minecraft:set_count",count:-1,add:true}
execute if score @s fletching_table.prev_arrows_crafting matches 1.. if score @s fletching_table.consumed_slot matches 11 run item modify block ~ ~ ~ container.18 {function:"minecraft:set_count",count:-1,add:true}

# bow crafting
execute if score @s fletching_table.prev_bows_crafting matches 1.. if score @s fletching_table.consumed_slot matches 17 at @s run playsound minecraft:entity.villager.work_fletcher block @a ~ ~ ~
execute if score @s fletching_table.prev_bows_crafting matches 1.. if score @s fletching_table.consumed_slot matches 17 run item modify block ~ ~ ~ container.5 {function:"minecraft:set_count",count:-1,add:true}
execute if score @s fletching_table.prev_bows_crafting matches 1.. if score @s fletching_table.consumed_slot matches 17 run item modify block ~ ~ ~ container.13 {function:"minecraft:set_count",count:-1,add:true}
execute if score @s fletching_table.prev_bows_crafting matches 1.. if score @s fletching_table.consumed_slot matches 17 run item modify block ~ ~ ~ container.23 {function:"minecraft:set_count",count:-1,add:true}
execute if score @s fletching_table.prev_bows_crafting matches 1.. if score @s fletching_table.consumed_slot matches 17 run item modify block ~ ~ ~ container.6 {function:"minecraft:set_count",count:-1,add:true}
execute if score @s fletching_table.prev_bows_crafting matches 1.. if score @s fletching_table.consumed_slot matches 17 run item modify block ~ ~ ~ container.15 {function:"minecraft:set_count",count:-1,add:true}
execute if score @s fletching_table.prev_bows_crafting matches 1.. if score @s fletching_table.consumed_slot matches 17 run item modify block ~ ~ ~ container.24 {function:"minecraft:set_count",count:-1,add:true}