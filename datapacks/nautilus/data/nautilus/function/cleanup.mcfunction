# if the item display still has a dolphin to ride, don't remove it
# execute on vehicle run return fail
execute on vehicle unless entity @s[nbt={Health:0f}] run return fail

# otherwise, kill the item display

# play a death sfx
execute if entity @s[tag=nautilus.body] at @s run playsound minecraft:entity.shulker.death ambient @a ~ ~ ~ 0.3 1.9
execute if entity @s[tag=nautilus.body] at @s run playsound minecraft:entity.shulker.close ambient @a ~ ~ ~ 1

kill @s