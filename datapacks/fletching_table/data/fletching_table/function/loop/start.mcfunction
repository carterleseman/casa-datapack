# a helper function that runs a loop
$scoreboard objectives add fletching_table.loop_$(id) dummy

$scoreboard players set @s fletching_table.loop_$(id) $(start)
$function fletching_table:loop/iter { id: $(id), function: "$(function)", arguments: $(arguments), start: $(start), end: $(end), step: $(step), scale: $(scale) }