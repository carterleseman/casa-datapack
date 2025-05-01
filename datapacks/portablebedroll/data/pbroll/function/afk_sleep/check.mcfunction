# tellraw @p "afk_sleep DEBUG Checking if a player is sleeping"
execute if entity @a[tag=pbroll.player.sleeping] run return run function pbroll:afk_sleep/skip
function afk_sleep:internal/while_sleeping/nobody_sleeping