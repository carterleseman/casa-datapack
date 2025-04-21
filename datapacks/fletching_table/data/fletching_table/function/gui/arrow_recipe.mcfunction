# if the recipe works, but we previously crafted something else, clear the output slot.
# we'll also say the recipe failed for this tick so we don't accidentally craft the previous item.
# on the next tick, these branches will fail and the recipe will be available for the player.
$execute if score @s fletching_table.prev_arrows_crafting matches 1.. unless score @s fletching_table.prev_arrows_crafting matches $(recipe_id) if items block ~ ~ ~ container.18 $(0) if items block ~ ~ ~ container.9 $(1) if items block ~ ~ ~ container.0 $(2) run item replace block ~ ~ ~ container.11 with minecraft:air
$execute if score @s fletching_table.prev_arrows_crafting matches 1.. unless score @s fletching_table.prev_arrows_crafting matches $(recipe_id) if items block ~ ~ ~ container.18 $(0) if items block ~ ~ ~ container.9 $(1) if items block ~ ~ ~ container.0 $(2) run return fail

# when crafting succeeds, send the recipe id back.
$execute if items block ~ ~ ~ container.18 $(0) if items block ~ ~ ~ container.9 $(1) if items block ~ ~ ~ container.0 $(2) run function fletching_table:gui/lock_slot { slot: 11, item: '$(result)', count: $(count) }
$execute if items block ~ ~ ~ container.18 $(0) if items block ~ ~ ~ container.9 $(1) if items block ~ ~ ~ container.0 $(2) run return $(recipe_id)

return fail