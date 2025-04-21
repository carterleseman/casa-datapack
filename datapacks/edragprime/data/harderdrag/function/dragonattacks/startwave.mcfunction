summon item_display ~ ~ ~ {Tags:["wave",newwave],view_range:0}
tp @e[tag=newwave] ^ ^ ^1.3 ~ 0

execute as @e[tag=newwave] store result score @s wavedistance run random value 50..70

tag @e remove newwave
scoreboard players add waverotate rando 1
execute if score waverotate rando matches ..120 rotated ~3 0 run function harderdrag:dragonattacks/startwave
execute if score waverotate rando matches 121.. run scoreboard players set waverotate rando 0

kill @e[tag=shockwaveprojectile]
kill @e[tag=shockwavetarget]