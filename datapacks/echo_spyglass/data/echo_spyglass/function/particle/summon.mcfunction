$summon minecraft:text_display ~ ~ ~ { Tags: ["echo_spyglass.particle","echo_spyglass.particle.setup"], text: {text:"\ua0$(id)1", font:"echo_spyglass:default"}, alignment: "center", see_through: true, billboard: "center", background: 16711680 }
$scoreboard players set @e[type=minecraft:text_display,tag=echo_spyglass.particle.setup] echo_spyglass.particle.id $(id)
scoreboard players set @e[type=minecraft:text_display,tag=echo_spyglass.particle.setup] echo_spyglass.particle.age 1
scoreboard players set @e[type=minecraft:text_display,tag=echo_spyglass.particle.setup] echo_spyglass.particle.opacity 8
team join echo_spyglass.using @e[type=minecraft:text_display,tag=echo_spyglass.particle.setup]
execute as @e[type=minecraft:text_display,tag=echo_spyglass.particle.setup] run tag @s remove echo_spyglass.particle.setup