# water propagation values
scoreboard objectives add copper_pipes.water dummy
scoreboard objectives add copper_pipes.zero dummy
scoreboard objectives add copper_pipes.one dummy
scoreboard objectives add copper_pipes.water_comp_0 dummy
scoreboard objectives add copper_pipes.water_comp_1 dummy

# detecting soul sand/magma
scoreboard objectives add copper_pipes.bubble_column_up dummy
scoreboard objectives add copper_pipes.bubble_column_down dummy

# detecting which blocks have updated during a tick to avoid water propagating too fast
scoreboard objectives add copper_pipes.prev_water dummy
scoreboard objectives add copper_pipes.level_changed dummy

# the distance an item has traveled through pipes
scoreboard objectives add copper_pipes.transfer_distance dummy
scoreboard objectives add copper_pipes.pitch dummy

# smoke propagation
scoreboard objectives add copper_pipes.smoke dummy

# water only updates every 5 ticks
function copper_pipes:water/tick

# items only update every 8 ticks
function copper_pipes:item_transport/tick

function copper_pipes:water/ambience_tick

function copper_pipes:smoke/tick