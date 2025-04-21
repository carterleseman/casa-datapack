scoreboard objectives add Timer dummy
scoreboard objectives add Creaking dummy
scoreboard objectives add ThePaleGardenRemastered trigger
scoreboard players enable @a ThePaleGardenRemastered

execute unless score #fog ThePaleGardenRemastered matches 0..1 run scoreboard players set #fog ThePaleGardenRemastered 1
execute unless score #rain ThePaleGardenRemastered matches 0..1 run scoreboard players set #rain ThePaleGardenRemastered 1
execute unless score #sound ThePaleGardenRemastered matches 0..1 run scoreboard players set #sound ThePaleGardenRemastered 1
execute unless score #particles ThePaleGardenRemastered matches 0..1 run scoreboard players set #particles ThePaleGardenRemastered 1
execute unless score #creaking_variants ThePaleGardenRemastered matches 0..1 run scoreboard players set #creaking_variants ThePaleGardenRemastered 1
