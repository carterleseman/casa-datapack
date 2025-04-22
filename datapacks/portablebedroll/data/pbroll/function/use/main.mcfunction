##
 # main.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
data remove entity @s interaction

execute as @s[tag=pbroll.interaction.bedroll.west.head,tag=!pbroll.interaction.hassleeper] at @s run function pbroll:use/sleep/west
execute as @s[tag=pbroll.interaction.bedroll.east.head,tag=!pbroll.interaction.hassleeper] at @s run function pbroll:use/sleep/east
execute as @s[tag=pbroll.interaction.bedroll.north.head,tag=!pbroll.interaction.hassleeper] at @s run function pbroll:use/sleep/north
execute as @s[tag=pbroll.interaction.bedroll.south.head,tag=!pbroll.interaction.hassleeper] at @s run function pbroll:use/sleep/south

execute as @s[tag=pbroll.interaction.bedroll.west.feet] at @s positioned ~1 ~ ~ as @e[tag=pbroll.interaction.bedroll.west.head,tag=!pbroll.interaction.hassleeper,distance=..0.1,limit=1,sort=nearest] at @s run function pbroll:use/sleep/west
execute as @s[tag=pbroll.interaction.bedroll.east.feet] at @s positioned ~-1 ~ ~ as @e[tag=pbroll.interaction.bedroll.east.head,tag=!pbroll.interaction.hassleeper,distance=..0.1,limit=1,sort=nearest] at @s run function pbroll:use/sleep/east
execute as @s[tag=pbroll.interaction.bedroll.north.feet] at @s positioned ~ ~ ~1 as @e[tag=pbroll.interaction.bedroll.north.head,tag=!pbroll.interaction.hassleeper,distance=..0.1,limit=1,sort=nearest] at @s run function pbroll:use/sleep/north
execute as @s[tag=pbroll.interaction.bedroll.south.feet] at @s positioned ~ ~ ~-1 as @e[tag=pbroll.interaction.bedroll.south.head,tag=!pbroll.interaction.hassleeper,distance=..0.1,limit=1,sort=nearest] at @s run function pbroll:use/sleep/south

