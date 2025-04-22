execute as @e[type=minecraft:text_display,tag=echo_spyglass.particle] run function echo_spyglass:particle/tick

schedule function echo_spyglass:tick_particles 2t