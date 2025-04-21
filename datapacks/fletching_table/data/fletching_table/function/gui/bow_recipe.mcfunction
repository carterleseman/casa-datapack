# if the recipe works, but we previously crafted something else, clear the output slot.
# we'll also say the recipe failed for this tick so we don't accidentally craft the previous item.
# on the next tick, these branches will fail and the recipe will be available for the player.
$execute if score @s fletching_table.prev_bows_crafting matches 1.. unless score @s fletching_table.prev_bows_crafting matches $(recipe_id) if items block ~ ~ ~ container.5 $(0) if items block ~ ~ ~ container.13 $(1) if items block ~ ~ ~ container.23 $(2) if items block ~ ~ ~ container.6 $(string) if items block ~ ~ ~ container.15 $(string) if items block ~ ~ ~ container.24 $(string) run item replace block ~ ~ ~ container.17 with minecraft:air
$execute if score @s fletching_table.prev_bows_crafting matches 1.. unless score @s fletching_table.prev_bows_crafting matches $(recipe_id) if items block ~ ~ ~ container.5 $(0) if items block ~ ~ ~ container.13 $(1) if items block ~ ~ ~ container.23 $(2) if items block ~ ~ ~ container.6 $(string) if items block ~ ~ ~ container.15 $(string) if items block ~ ~ ~ container.24 $(string) run return fail

# when crafting succeeds, send the recipe id back.
$execute if items block ~ ~ ~ container.5 $(0) if items block ~ ~ ~ container.13 $(1) if items block ~ ~ ~ container.23 $(2) if items block ~ ~ ~ container.6 $(string) if items block ~ ~ ~ container.15 $(string) if items block ~ ~ ~ container.24 $(string) run function fletching_table:gui/lock_slot { slot: 17, item: '$(result)', count: $(count) }
$execute if items block ~ ~ ~ container.5 $(0) if items block ~ ~ ~ container.13 $(1) if items block ~ ~ ~ container.23 $(2) if items block ~ ~ ~ container.6 $(string) if items block ~ ~ ~ container.15 $(string) if items block ~ ~ ~ container.24 $(string) run return $(recipe_id)

return fail