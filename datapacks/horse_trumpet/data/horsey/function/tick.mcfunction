execute as @a[tag=horsey.owner,scores={horsey.timer=1..49}] run scoreboard players add @s horsey.timer 1
execute as @a[tag=horsey.owner,scores={horsey.timer=50}] run function horsey:trumpet/locate with storage horsey:main
execute as @a[tag=horsey.owner,scores={horsey.timer=50}] run scoreboard players set @s horsey.timer 0