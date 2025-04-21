# update animation index, resetting if it goes past the end
scoreboard players add @e[type=#echo_trim:armor_equippable] echo_trim.animation 1
execute as @e[type=#echo_trim:armor_equippable] if score @s echo_trim.animation matches 17 run scoreboard players set @s echo_trim.animation 1
scoreboard players set #one echo_trim.prev_animation 1
execute as @e[type=#echo_trim:armor_equippable] store result score @s echo_trim.prev_animation run scoreboard players get @s echo_trim.animation
scoreboard players operation @e[type=#echo_trim:armor_equippable] echo_trim.prev_animation -= #one echo_trim.prev_animation
execute as @e[type=#echo_trim:armor_equippable] if score @s echo_trim.prev_animation matches 0 run scoreboard players set @s echo_trim.prev_animation 16

# player armor is in the `Inventory` field
execute as @a run function echo_trim:tick_slot { slot: "armor.feet", field: "equipment.feet", }
execute as @a run function echo_trim:tick_slot { slot: "armor.legs", field: "equipment.legs", }
execute as @a run function echo_trim:tick_slot { slot: "armor.chest", field: "equipment.chest", }
execute as @a run function echo_trim:tick_slot { slot: "armor.head", field: "equipment.head", }

# entity armor is the in the `ArmorItems` field
execute as @e[type=#echo_trim:armor_equippable] run function echo_trim:tick_slot { slot: "armor.feet", field: "equipment.feet", }
execute as @e[type=#echo_trim:armor_equippable] run function echo_trim:tick_slot { slot: "armor.legs", field: "equipment.legs", }
execute as @e[type=#echo_trim:armor_equippable] run function echo_trim:tick_slot { slot: "armor.chest", field: "equipment.chest", }
execute as @e[type=#echo_trim:armor_equippable] run function echo_trim:tick_slot { slot: "armor.head", field: "equipment.head", }

schedule function echo_trim:tick_animation 3t