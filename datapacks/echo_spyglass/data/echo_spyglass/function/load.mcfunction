scoreboard objectives add echo_spyglass.particle.id dummy
scoreboard objectives add echo_spyglass.particle.age dummy
scoreboard objectives add echo_spyglass.particle.opacity dummy
scoreboard objectives add echo_spyglass.gaze_time dummy

team add echo_spyglass.using
team add echo_spyglass.glow
team modify echo_spyglass.glow color aqua

schedule function echo_spyglass:tick_particles 2t