# play a sfx with an increasing pitch with each block traveled
execute on passengers unless score @s copper_pipes.transfer_distance matches 50 run scoreboard players add @s copper_pipes.transfer_distance 1
execute on passengers if score @s copper_pipes.transfer_distance matches 1 run playsound minecraft:entity.generic.splash block @a ~ ~ ~ 0.5

data modify storage copper_pipes:sfx sound set value "minecraft:block.copper_grate.step"
data modify storage copper_pipes:sfx volume set value 0.25
execute on passengers store result score @s copper_pipes.pitch run scoreboard players get @s copper_pipes.transfer_distance
execute on passengers run scoreboard players add @s copper_pipes.pitch 25
execute on passengers store result storage copper_pipes:sfx pitch float 0.02 run scoreboard players get @s copper_pipes.pitch
execute on passengers run function copper_pipes:play_pitched with storage copper_pipes:sfx

execute on passengers run function copper_pipes:item_transport/ride_grate