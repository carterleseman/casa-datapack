scoreboard players set @a give_head 0

execute if score &give_head config.player_drops_head matches 1 run data modify storage playerdropshead:give_head_macro player_name set from entity @s SelectedItem.components.minecraft:writable_book_content.pages[0].raw

execute if score &give_head config.player_drops_head matches 1 run function playerdropshead:app/give_head_macro with storage playerdropshead:give_head_macro

