scoreboard objectives add help.playerdropshead trigger

scoreboard objectives add give_own_head trigger

scoreboard objectives add give_head trigger

scoreboard objectives add config.player_drops_head dummy

scoreboard objectives add head_drops dummy

execute unless score &give_own_head config.player_drops_head = &give_own_head config.player_drops_head run scoreboard players set &give_own_head config.player_drops_head 1

execute unless score &give_head config.player_drops_head = &give_head config.player_drops_head run scoreboard players set &give_head config.player_drops_head 0

# 0 = head drops only when killed by player, 1 = head drops always
execute unless score &head_drops config.player_drops_head = &head_drops config.player_drops_head run scoreboard players set &head_drops config.player_drops_head 0

scoreboard objectives add playerdropshead.image dummy

# Print the image
function playerdropshead:config/image