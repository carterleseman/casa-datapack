##
 # load.mcfunction
 # 
 #
 # Created by imalittlhigh
##
scoreboard objectives add pbroll.left minecraft.custom:leave_game
scoreboard objectives add pbroll.dummy dummy
scoreboard players set $pbroll.100x pbroll.dummy 100

scoreboard objectives add pbroll.sleeping minecraft.custom:minecraft.sleep_in_bed
scoreboard objectives add pbroll.awake minecraft.custom:minecraft.time_since_rest