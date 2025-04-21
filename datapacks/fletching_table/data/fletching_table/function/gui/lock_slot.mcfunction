$execute if items block ~ ~ ~ container.$(slot) $(item) run return run function fletching_table:gui/lock_slot_count { slot: $(slot), item: '$(item)', count: $(count) }

$data modify storage fletching_table:lock_slot item set from block ~ ~ ~ Items[{Slot:$(slot)b}]
execute unless data storage fletching_table:lock_slot item.components run data modify storage fletching_table:lock_slot item.components set value {}
execute if data storage fletching_table:lock_slot give_extras run function fletching_table:gui/give with storage fletching_table:lock_slot item
data remove storage fletching_table:lock_slot item

# run a function that the player took the items in the slot
$function fletching_table:gui/player_consumed_slot { slot: $(slot) }

$item replace block ~ ~ ~ container.$(slot) with $(item) $(count)