$execute if score @s $(objective) matches 0 run playsound minecraft:block.bubble_column.$(sound)_ambient ambient @a ~ ~ ~
scoreboard players set @s copper_pipes.bubble_column_up 0
scoreboard players set @s copper_pipes.bubble_column_down 0
$scoreboard players set @s $(objective) 1