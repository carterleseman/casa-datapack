##
 # config.mcfunction
 # 
 #
 # Created by imalittlhigh.
##

tellraw @s ["",{"text":"-----------------------------------","color":"gold"},{"text":"\nPortable Bedroll Config:\n\n Required percentage of sleeping players\n"},{"text":" - adjust","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $pbroll.sleeppercentage pbroll.dummy "},"hoverEvent":{"action":"show_text","contents":"Klick and type the percentage you want (1-100)"}},{"text":"\n"},{"text":" - set to gamerule","clickEvent":{"action":"run_command","value":"/execute store result score $pbroll.sleeppercentage pbroll.dummy run gamerule playersSleepingPercentage"},"hoverEvent":{"action":"show_text","contents":"Klick to set to gamerule settings"}},{"text":"\n\n"},{"text":"-----------------------------------","color":"gold"}]