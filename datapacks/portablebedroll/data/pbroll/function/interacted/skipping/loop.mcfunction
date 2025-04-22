##
 # loop.mcfunction
 # 
 #
 # Created by imalittlhigh.
##


execute if score $pbroll.resttime.calc pbroll.dummy matches 1.. run time add 100
scoreboard players remove $pbroll.resttime.calc pbroll.dummy 1
execute if score $pbroll.resttime.calc pbroll.dummy matches 1.. run function pbroll:interacted/skipping/loop


execute if score $pbroll.resttime.calc pbroll.dummy matches 0 if predicate pbroll:thundering run weather thunder 1t
execute if score $pbroll.resttime.calc pbroll.dummy matches 0 if predicate pbroll:raining run weather rain 1t

execute if score $pbroll.resttime.calc pbroll.dummy matches 0 as @a[tag=pbroll.player.sleeping] at @s run function pbroll:use/wake

