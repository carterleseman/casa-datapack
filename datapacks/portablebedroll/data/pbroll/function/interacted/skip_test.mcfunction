##
 # skip_test.mcfunction
 # 
 #
 # Created by imalittlhigh.
##

scoreboard players reset $pbroll.playercount
scoreboard players reset $pbroll.playercount.asleep


execute store result score $pbroll.playercount pbroll.dummy if entity @a[predicate=pbroll:is_in_overworld]
execute store result score $pbroll.playercount.asleep pbroll.dummy if entity @a[tag=pbroll.player.sleeping,predicate=pbroll:is_in_overworld]
execute store result score $pbroll.playercount.asleep.bed pbroll.dummy if entity @a[tag=pbroll.player.sleeping.bed,predicate=pbroll:is_in_overworld]
scoreboard players operation $pbroll.playercount.asleep pbroll.dummy += $pbroll.playercount.asleep.bed pbroll.dummy


execute if score $pbroll.sleeppercentage pbroll.dummy matches 0.. run scoreboard players operation $pbroll.playercount.asleep pbroll.dummy *= $pbroll.100x pbroll.dummy
execute if score $pbroll.sleeppercentage pbroll.dummy matches 0.. run scoreboard players operation $pbroll.playercount.asleep pbroll.dummy /= $pbroll.sleeppercentage pbroll.dummy


execute as @r[predicate=pbroll:is_in_overworld] if predicate pbroll:sleepy_time if score $pbroll.playercount.asleep pbroll.dummy matches 1.. if score $pbroll.playercount.asleep pbroll.dummy >= $pbroll.playercount pbroll.dummy run function pbroll:interacted/skip_night


execute as @r[predicate=pbroll:is_in_overworld] if predicate pbroll:sleepy_time if score $pbroll.playercount.asleep pbroll.dummy matches 1.. if score $pbroll.playercount.asleep pbroll.dummy <= $pbroll.playercount pbroll.dummy run schedule function pbroll:interacted/skip_test 1s replace