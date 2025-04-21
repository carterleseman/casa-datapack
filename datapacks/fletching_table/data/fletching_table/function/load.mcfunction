# crafting
data modify storage fletching_table:lock_slot give_extras set value true

scoreboard objectives add fletching_table.arrows_crafting dummy
scoreboard objectives add fletching_table.prev_arrows_crafting dummy

scoreboard objectives add fletching_table.bows_crafting dummy
scoreboard objectives add fletching_table.prev_bows_crafting dummy

scoreboard objectives add fletching_table.lock_slot_count dummy
scoreboard objectives add fletching_table.lock_slot_count_target dummy

scoreboard objectives add fletching_table.consumed_slot dummy

# arrows
scoreboard objectives add fletching_table.slime_arrow_vx dummy
scoreboard objectives add fletching_table.slime_arrow_vy dummy
scoreboard objectives add fletching_table.slime_arrow_vz dummy

scoreboard objectives add fletching_table.torch_arrow_decay dummy

scoreboard objectives add fletching_table.gold_arrow dummy

scoreboard objectives add fletching_table.echo_arrow_x dummy
scoreboard objectives add fletching_table.echo_arrow_y dummy
scoreboard objectives add fletching_table.echo_arrow_z dummy
scoreboard objectives add fletching_table.echo_arrow_x_abs dummy
scoreboard objectives add fletching_table.echo_arrow_y_abs dummy
scoreboard objectives add fletching_table.echo_arrow_z_abs dummy
scoreboard objectives add fletching_table.echo_arrow_lifetime dummy