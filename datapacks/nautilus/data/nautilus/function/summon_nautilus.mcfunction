summon minecraft:dolphin ~ ~ ~ { Tags: ["nautilus.setup"], PersistenceRequired: true, Silent: true, DeathLootTable: "nautilus:nautilus", active_effects: [{id:"minecraft:invisibility",duration:999999999,show_particles:false}], attributes: [{id:"minecraft:scale",base:0.5}, {id:"minecraft:movement_speed",base:0.5}], Passengers: [{id:"minecraft:item_display", Tags:["nautilus.body"], item:{id:"minecraft:nautilus_shell",components:{"minecraft:item_model":"nautilus:nautilus_body"}}, teleport_duration: 6}, {id:"minecraft:item_display", Tags:["nautilus.head"], item:{id:"minecraft:nautilus_shell",components:{"minecraft:item_model":"nautilus:nautilus_head"}}, teleport_duration: 1}] }

tag @e[type=minecraft:dolphin,tag=nautilus.setup] add nautilus

tag @e[type=minecraft:dolphin,tag=nautilus.setup] remove nautilus.setup

playsound minecraft:entity.item_frame.remove_item neutral @a ~ ~ ~ 1 0.5
particle minecraft:poof ~ ~ ~ 0.2 0.2 0.2 0 10