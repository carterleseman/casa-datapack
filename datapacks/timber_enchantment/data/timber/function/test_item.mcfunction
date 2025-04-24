summon armor_stand ~ ~ ~ {Tags:[tmbr.as],NoGravity:1b,Invisible:true,Marker: true}
data modify entity @e[type=armor_stand,tag=tmbr.as,limit=1,distance=..1] HandItems[0] set from entity @s Item
data modify storage timber:tmp block set from entity @s Item.id

execute as @e[type=armor_stand,tag=tmbr.as,limit=1,distance=..1] store success score #s tmbr.tmp if predicate timber:check_item
kill @e[type=armor_stand,tag=tmbr.as,distance=..1]

execute if score #s tmbr.tmp matches 0 run return fail
return 1