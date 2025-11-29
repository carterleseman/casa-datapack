scoreboard players reset @s ThePaleGardenRemastered
scoreboard players enable @s ThePaleGardenRemastered

# --------------------------------------------------------------------------------- #

tellraw @a [{text:"\n\n\n\n\n\n\n\n\n\n-=-=-=-=-= ",color: "gray"},{text:"The Pale Garden Remastered",color:"gold"},{text:" =-=-=-=-=-\n",color: "gray"}]

execute if score #rain ThePaleGardenRemastered matches 1 run tellraw @a [{text: "Rain SFX:  ", color: "aqua", hover_event:{action:"show_text",value:"Shows rain sfx."}},{text: "Enabled", color: "green", click_event:{action: "run_command", command: "/function main:handler/settings/rain_sfx"}}]
execute if score #rain ThePaleGardenRemastered matches 0 run tellraw @a [{text: "Rain SFX:  ", color: "aqua", hover_event:{action:"show_text",value:"Shows rain sfx."}},{text: "Disabled", color: "red", click_event:{action: "run_command", command: "/function main:handler/settings/rain_sfx"}}]


execute if score #fog ThePaleGardenRemastered matches 1 run tellraw @a [{text: "Thick fog: ", color: "aqua", hover_event:{action:"show_text",value:"Gives players the elusion of fog."}},{text: "Enabled", color: "green", click_event:{action: "run_command", command: "/function main:handler/settings/fog"}}]
execute if score #fog ThePaleGardenRemastered matches 0 run tellraw @a [{text: "Thick fog: ", color: "aqua", hover_event:{action:"show_text",value:"Gives players the elusion of fog."}},{text: "Disabled", color: "red", click_event:{action: "run_command", command: "/function main:handler/settings/fog"}}]


execute if score #particles ThePaleGardenRemastered matches 1 run tellraw @a [{text: "Ambient Particles:  ", color: "aqua", hover_event:{action:"show_text",value:"Shows ambient particles."}},{text: "Enabled", color: "green", click_event:{action: "run_command", command: "/function main:handler/settings/particles"}}]
execute if score #particles ThePaleGardenRemastered matches 0 run tellraw @a [{text: "Ambient Particles:  ", color: "aqua", hover_event:{action:"show_text",value:"Shows ambient particles."}},{text: "Disabled", color: "red", click_event:{action: "run_command", command: "/function main:handler/settings/particles"}}]


execute if score #sound ThePaleGardenRemastered matches 1 run tellraw @a [{text: "Ambient Sounds:  ", color: "aqua", hover_event:{action:"show_text",value:"Emits ambient sounds."}},{text: "Enabled", color: "green", click_event:{action: "run_command", command: "/function main:handler/settings/sound"}}]
execute if score #sound ThePaleGardenRemastered matches 0 run tellraw @a [{text: "Ambient Sounds:  ", color: "aqua", hover_event:{action:"show_text",value:"Emits ambient sounds."}},{text: "Disabled", color: "red", click_event:{action: "run_command", command: "/function main:handler/settings/sound"}}]


execute if score #creaking_variants ThePaleGardenRemastered matches 1 run tellraw @a [{text: "Creaking Variants:  ", color: "aqua", hover_event:{action:"show_text",value:"The Creaking can summon variants of itself."}},{text: "Enabled", color: "green", click_event:{action: "run_command", command: "/function main:handler/settings/variants"}}]
execute if score #creaking_variants ThePaleGardenRemastered matches 0 run tellraw @a [{text: "Creaking Variants:  ", color: "aqua", hover_event:{action:"show_text",value:"The Creaking can summon variants of itself."}},{text: "Disabled", color: "red", click_event:{action: "run_command", command: "/function main:handler/settings/variants"}}]



tellraw @a [{text: "\n"},{text: "Click on Enabled/Disabled to change it!", color: "dark_aqua"}]
tellraw @a [{text: "•=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=•", color: "gray"}]
