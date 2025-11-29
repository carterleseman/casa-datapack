function afk:reset_player
scoreboard players reset @s afk.left_game

scoreboard players set .as_player#has_branched afk.control_flow 1
