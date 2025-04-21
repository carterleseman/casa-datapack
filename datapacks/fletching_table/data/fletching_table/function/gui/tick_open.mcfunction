# setup locked slots and gui elements
function fletching_table:gui/lock_slot { slot: 1, item: 'minecraft:barrier[minecraft:item_model="minecraft:air",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }
function fletching_table:gui/lock_slot { slot: 2, item: 'minecraft:barrier[minecraft:item_model="minecraft:air",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }
function fletching_table:gui/lock_slot { slot: 3, item: 'minecraft:barrier[minecraft:item_model="minecraft:air",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }
function fletching_table:gui/lock_slot { slot: 4, item: 'minecraft:barrier[minecraft:item_model="minecraft:air",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }

function fletching_table:gui/lock_slot { slot: 7, item: 'minecraft:barrier[minecraft:item_model="minecraft:air",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }
function fletching_table:gui/lock_slot { slot: 8, item: 'minecraft:barrier[minecraft:item_model="minecraft:air",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }

# show hints for the arrow recipes unless an item is placed in the top slot
data remove storage fletching_table:lock_slot give_extras
execute unless items block ~ ~ ~ container.0 * run function fletching_table:gui/lock_slot { slot: 10, item: 'minecraft:barrier[minecraft:item_model="fletching_table:arrow_hints",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }
execute if items block ~ ~ ~ container.0 * run function fletching_table:gui/lock_slot { slot: 10, item: 'minecraft:barrier[minecraft:item_model="fletching_table:arrow_ingredients_no_hints",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }
data modify storage fletching_table:lock_slot give_extras set value true

function fletching_table:gui/lock_slot { slot: 12, item: 'minecraft:barrier[minecraft:item_model="fletching_table:arrow_output",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }
function fletching_table:gui/lock_slot { slot: 14, item: 'minecraft:barrier[minecraft:item_model="fletching_table:bow_hints",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }
function fletching_table:gui/lock_slot { slot: 16, item: 'minecraft:barrier[minecraft:item_model="fletching_table:bow_output",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }

function fletching_table:gui/lock_slot { slot: 19, item: 'minecraft:barrier[minecraft:item_model="minecraft:air",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }
function fletching_table:gui/lock_slot { slot: 20, item: 'minecraft:barrier[minecraft:item_model="minecraft:air",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }
function fletching_table:gui/lock_slot { slot: 21, item: 'minecraft:barrier[minecraft:item_model="minecraft:air",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }
function fletching_table:gui/lock_slot { slot: 22, item: 'minecraft:barrier[minecraft:item_model="minecraft:air",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }
function fletching_table:gui/lock_slot { slot: 25, item: 'minecraft:barrier[minecraft:item_model="minecraft:air",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }
function fletching_table:gui/lock_slot { slot: 26, item: 'minecraft:barrier[minecraft:item_model="minecraft:air",minecraft:tooltip_display={hide_tooltip:true},minecraft:custom_data={fletching_table_gui:true}]', count: 1 }

# handle crafting
execute unless data storage fletching_table:arrows crafting_result run data modify storage fletching_table:arrows crafting_result set value "*"
function fletching_table:tick/arrow_recipes with storage fletching_table:arrows

execute unless data storage fletching_table:bows crafting_result run data modify storage fletching_table:bows crafting_result set value "*"
function fletching_table:tick/bow_recipes with storage fletching_table:bows