execute as @e[type=minecraft:item, nbt={Item:{components:{"minecraft:custom_data":{nautilus: true}}}}] at @s run function nautilus:summon_nautilus
execute as @e[type=minecraft:item, nbt={Item:{components:{"minecraft:custom_data":{nautilus: true}}}}] run kill @s

# if the player picks up the nautilus tag before it can summon
# this might be a bug with suspicious blocks? should they set a pickup delay on their dropped items?
execute as @a if function nautilus:clear at @s run function nautilus:summon_nautilus

scoreboard players add @e[type=minecraft:dolphin,tag=nautilus] nautilus.lifetime 1
execute as @e[type=minecraft:dolphin,tag=nautilus] run data modify entity @s Air set value 32767s

# if the player hurts the nautilus, almost immediately start looking for gravel to hide in
execute as @e[type=minecraft:dolphin,nbt={HurtTime:10s}] run scoreboard players set @s nautilus.lifetime 180
execute as @e[type=minecraft:dolphin,nbt={HurtTime:10s}] at @s run playsound minecraft:entity.shulker.hurt neutral @a ~ ~ ~ 0.3 1.9

# when the nautilus reaches 100 ticks alive, start moving down when over a gravel block
execute as @e[type=minecraft:dolphin,tag=nautilus] at @s if score @s nautilus.lifetime matches 100.. if block ~ ~-.05 ~ minecraft:water if block ~-.225 ~-.05 ~ minecraft:water if block ~.225 ~-.05 ~ minecraft:water if block ~ ~-.05 ~-.225 minecraft:water if block ~ ~-.05 ~.225 minecraft:water if function nautilus:find_gravel run tp @s ~ ~-.05 ~

# when the lifetime reaches 200 ticks, allow the nautilus to hide in gravel blocks if its directly above one
execute as @e[type=minecraft:dolphin,tag=nautilus] if score @s nautilus.lifetime matches 200.. at @s positioned ~ ~-.05 ~ if block ~ ~ ~ minecraft:gravel run function nautilus:burrow

# animate nautilus model to rotate with dolphin
execute as @e[type=minecraft:dolphin,tag=nautilus] rotated as @s on passengers if entity @s[tag=nautilus.body] run rotate @s ~ ~
execute as @e[type=minecraft:dolphin,tag=nautilus] rotated as @s on passengers if entity @s[tag=nautilus.head] run rotate @s ~ ~

# random sfx
execute as @e[type=minecraft:dolphin,tag=nautilus] if predicate { condition: "minecraft:random_chance", chance: 0.01 } at @s run playsound minecraft:entity.shulker.open ambient @a ~ ~ ~ 0.1 1.9

execute as @e[type=minecraft:item_display,tag=nautilus.body] run function nautilus:cleanup
execute as @e[type=minecraft:item_display,tag=nautilus.head] run function nautilus:cleanup

execute as @e[type=minecraft:dolphin,tag=nautilus] unless data entity @s { HurtTime: 0s } on passengers if entity @s[tag=nautilus.body] run data modify entity @s item.components."minecraft:item_model" set value "nautilus:nautilus_body_hurt"
execute as @e[type=minecraft:dolphin,tag=nautilus] unless data entity @s { HurtTime: 0s } on passengers if entity @s[tag=nautilus.head] run data modify entity @s item.components."minecraft:item_model" set value "nautilus:nautilus_head_hurt"
execute as @e[type=minecraft:dolphin,tag=nautilus] if data entity @s { HurtTime: 0s } on passengers if entity @s[tag=nautilus.body] run data modify entity @s item.components."minecraft:item_model" set value "nautilus:nautilus_body"
execute as @e[type=minecraft:dolphin,tag=nautilus] if data entity @s { HurtTime: 0s } on passengers if entity @s[tag=nautilus.head] run data modify entity @s item.components."minecraft:item_model" set value "nautilus:nautilus_head"

execute at @e[type=minecraft:dolphin,tag=nautilus] run effect give @a[distance=..9,predicate=nautilus:swimming] minecraft:conduit_power 5 1 false