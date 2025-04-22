##
 # lmb.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
advancement revoke @s only pbroll:lmb_interaction

execute as @e[tag=pbroll.interaction.bedroll,nbt={attack:{}}] at @s run function pbroll:remove/main
