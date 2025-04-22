# update age and remove if too old
scoreboard players add @s echo_spyglass.particle.age 1
execute if score @s echo_spyglass.particle.age matches 9.. run kill @s
execute if score @s echo_spyglass.particle.age matches 9.. run return fail

execute if score @s echo_spyglass.particle.id matches 1 run scoreboard players remove @s echo_spyglass.particle.opacity 1

execute store result storage echo_spyglass:particle id int 1 run scoreboard players get @s echo_spyglass.particle.id
execute store result storage echo_spyglass:particle age int 1 run scoreboard players get @s echo_spyglass.particle.age
execute store result storage echo_spyglass:particle opacity int 30 run scoreboard players get @s echo_spyglass.particle.opacity
function echo_spyglass:particle/set_particle with storage echo_spyglass:particle