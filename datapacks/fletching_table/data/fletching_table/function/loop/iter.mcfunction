# run the function
$data modify storage fletching_table:loop $(id) set value $(arguments)
$execute store result storage fletching_table:loop $(id)._index float $(scale) run scoreboard players get @s fletching_table.loop_$(id)
$function $(function) with storage fletching_table:loop $(id)

# increment the index
$scoreboard players add @s fletching_table.loop_$(id) $(step)

# recurse
$execute if score @s fletching_table.loop_$(id) matches $(start)..$(end) run function fletching_table:loop/iter { id: $(id), function: "$(function)", arguments: $(arguments), start: $(start), end: $(end), step: $(step), scale: $(scale) }