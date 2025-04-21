scoreboard players enable @a help.playerdropshead

execute as @a if score @s help.playerdropshead matches 1 run function playerdropshead:app/trigger_help

scoreboard players enable @a give_own_head

execute as @a if score @s give_own_head matches 1 run function playerdropshead:app/trigger_give_own_head

scoreboard players enable @a give_head

execute as @a if score @s give_head matches 1 run function playerdropshead:app/trigger_give_any_head


execute if score &head_drops config.player_drops_head matches 0 run scoreboard players set @a head_drops 0

execute if score &head_drops config.player_drops_head matches 1 run scoreboard players set @a head_drops 1







