# dont target the player that shot the arrow
$execute if data entity @n { UUID: $(Owner) } run return fail
tag @n add fletching_table.arrow_echo.possible_target