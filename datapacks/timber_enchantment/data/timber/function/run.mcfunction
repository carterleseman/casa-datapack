execute unless predicate timber:sneaking run return 0
execute unless predicate timber:broke_block run return 0
function timber:reset_scores

execute anchored eyes positioned ^ ^ ^1.5 unless entity @e[type=item,distance=..4,nbt={Age:1s}] run return 0
execute anchored eyes positioned ^ ^ ^1.5 as @e[type=item,distance=..4,nbt={Age:1s}] run function timber:test_item

execute store result score #remaining tmbr.tmp run function timber:tool_durability

function timber:unbreaking

execute anchored eyes positioned ^ ^ ^1.5 at @e[type=item,distance=..4,nbt={Age:1s}] run function timber:flood_fill with storage timber:tmp

function timber:new_durability
