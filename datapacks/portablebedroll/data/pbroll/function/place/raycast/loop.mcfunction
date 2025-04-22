##
 # loop.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
#this adds one to the distance
scoreboard players add $pbroll.i pbroll.dummy 1

#tests if the block the function is on rn is a crafting table, if it is runns the next functon aligned to the block xyz (so if im looking at a corner it wont execute there, but always in the same spot on the block)
execute positioned ^ ^ ^ if block ~ ~ ~ #pbroll:heads{components:{"minecraft:custom_data":{bedroll:1b}}} align xyz positioned ~0.5 ~0.5 ~0.5 run function pbroll:place/raycast/hit
execute positioned ^1 ^ ^ if block ~ ~ ~ #pbroll:heads{components:{"minecraft:custom_data":{bedroll:1b}}} align xyz positioned ~0.5 ~0.5 ~0.5 run function pbroll:place/raycast/hit
execute positioned ^-1 ^ ^ if block ~ ~ ~ #pbroll:heads{components:{"minecraft:custom_data":{bedroll:1b}}} align xyz positioned ~0.5 ~0.5 ~0.5 run function pbroll:place/raycast/hit
execute positioned ^ ^1 ^ if block ~ ~ ~ #pbroll:heads{components:{"minecraft:custom_data":{bedroll:1b}}} align xyz positioned ~0.5 ~0.5 ~0.5 run function pbroll:place/raycast/hit
execute positioned ^ ^-1 ^ if block ~ ~ ~ #pbroll:heads{components:{"minecraft:custom_data":{bedroll:1b}}} align xyz positioned ~0.5 ~0.5 ~0.5 run function pbroll:place/raycast/hit
execute positioned ^2 ^ ^ if block ~ ~ ~ #pbroll:heads{components:{"minecraft:custom_data":{bedroll:1b}}} align xyz positioned ~0.5 ~0.5 ~0.5 run function pbroll:place/raycast/hit
execute positioned ^-2 ^ ^ if block ~ ~ ~ #pbroll:heads{components:{"minecraft:custom_data":{bedroll:1b}}} align xyz positioned ~0.5 ~0.5 ~0.5 run function pbroll:place/raycast/hit
execute positioned ^ ^2 ^ if block ~ ~ ~ #pbroll:heads{components:{"minecraft:custom_data":{bedroll:1b}}} align xyz positioned ~0.5 ~0.5 ~0.5 run function pbroll:place/raycast/hit
execute positioned ^ ^-2 ^ if block ~ ~ ~ #pbroll:heads{components:{"minecraft:custom_data":{bedroll:1b}}} align xyz positioned ~0.5 ~0.5 ~0.5 run function pbroll:place/raycast/hit


#executes if the distance isnt over 100 (10 blocks)                                   moves the cast 0.2 in the direction the player is looking and reexecutes this function
execute unless score $pbroll.i pbroll.dummy matches 60.. positioned ^ ^ ^0.2 run function pbroll:place/raycast/loop
