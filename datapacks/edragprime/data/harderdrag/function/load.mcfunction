scoreboard objectives add rando dummy
scoreboard objectives add particle dummy
scoreboard objectives add particle2 dummy
scoreboard objectives add wavedistance dummy
scoreboard objectives add settings dummy
scoreboard objectives add endermanagro dummy

scoreboard players set wavecooldown rando 0
scoreboard players set .2 rando 2
scoreboard players set .1 rando 1

team add shulkers
team modify shulkers color light_purple

execute unless score firsttime? settings matches 0 run function harderdrag:defaultsettings
scoreboard players set firsttime? settings 0

function harderdrag:dragonbehavior/dragonanger
function harderdrag:dragonbehavior/dragonperch
function harderdrag:dragonbehavior/spawnbarriers
function harderdrag:particles/particletick
function harderdrag:endermanspawn



#Without this gamerule change, the dragon explosion can bug out if there are a lot of players in the end

gamerule maxCommandChainLength 200000
