##
 # skip_night.mcfunction
 # 
 #
 # Created by imalittlhigh.
##

scoreboard players set $pbroll.daytime pbroll.dummy 24000
scoreboard players set $pbroll.resttime.calc pbroll.dummy 24000
scoreboard players set $pbroll.tenth.calc pbroll.dummy 100

execute store result score $pbroll.current.time pbroll.dummy run time query daytime

scoreboard players operation $pbroll.resttime.calc pbroll.dummy -= $pbroll.current.time pbroll.dummy
scoreboard players operation $pbroll.resttime.calc pbroll.dummy /= $pbroll.tenth.calc pbroll.dummy

execute if score $pbroll.resttime.calc pbroll.dummy matches ..0 as @a[tag=pbroll.player.sleeping] at @s run function pbroll:use/wake
execute if score $pbroll.resttime.calc pbroll.dummy matches 1.. run function pbroll:interacted/skipping/loop
