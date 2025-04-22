##
 # north.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
tp @a[tag=pbroll.player.interacted,limit=1,sort=nearest] ~ ~ ~-0.1

tag @a[tag=pbroll.player.interacted,limit=1,sort=nearest] add pbroll.player.sleeping

effect give @a[tag=pbroll.player.interacted,limit=1,sort=nearest] absorption 1 0 true

execute if entity @a[tag=pbroll.player.interacted,distance=..1,limit=1,sort=nearest] run tag @s add pbroll.interaction.hassleeper

execute if entity @a[tag=pbroll.player.interacted,distance=..1,limit=1,sort=nearest] run fill ~ ~1 ~ ~ ~1 ~ barrier replace air

tag @a[tag=pbroll.player.interacted,limit=1,sort=nearest] remove pbroll.player.interacted
