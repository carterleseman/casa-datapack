# if the player adds to a stack, give them their items back and leave the created ones
$execute if items block ~ ~ ~ container.$(slot) *[minecraft:count=$(count)] run return fail

$data modify storage fletching_table:lock_slot item set from block ~ ~ ~ Items[{Slot:$(slot)b}]
execute unless data storage fletching_table:lock_slot item.components run data modify storage fletching_table:lock_slot item.components set value {}

# find difference between locked count, and current count
execute store result score @s fletching_table.lock_slot_count run data get storage fletching_table:lock_slot item.count
$scoreboard players set @s fletching_table.lock_slot_count_target $(count)

# if the player removed an item, give them everything else in the slot to clear it out
# then run a function that the player took the items in the slot
$execute if score @s fletching_table.lock_slot_count < @s fletching_table.lock_slot_count_target run function fletching_table:gui/player_consumed_slot { slot: $(slot) }

# otherwise the player added an item, so give them the added items back but leave what existed.
execute if score @s fletching_table.lock_slot_count > @s fletching_table.lock_slot_count_target run scoreboard players operation @s fletching_table.lock_slot_count -= @s fletching_table.lock_slot_count_target

execute store result storage fletching_table:lock_slot item.count int 1 run scoreboard players get @s fletching_table.lock_slot_count

execute if data storage fletching_table:lock_slot give_extras run function fletching_table:gui/give with storage fletching_table:lock_slot item
data remove storage fletching_table:lock_slot item

$item replace block ~ ~ ~ container.$(slot) with $(item) $(count)