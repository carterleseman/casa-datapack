$execute unless items entity @s $(slot) *[minecraft:trim={material:"echo_trim:echo_$(prev_index)",pattern:"$(pattern)"}] run return fail

$item modify entity @s $(slot) { "function": "minecraft:set_components", "components": { "minecraft:trim": { "material": "echo_trim:echo_$(index)", "pattern": "$(pattern)" } } }
execute at @s run stopsound @a[distance=..16] * minecraft:item.armor.equip_leather
execute at @s run stopsound @a[distance=..16] * minecraft:item.armor.equip_iron
execute at @s run stopsound @a[distance=..16] * minecraft:item.armor.equip_gold
execute at @s run stopsound @a[distance=..16] * minecraft:item.armor.equip_diamond
execute at @s run stopsound @a[distance=..16] * minecraft:item.armor.equip_netherite
execute at @s run stopsound @a[distance=..16] * minecraft:item.armor.equip_turtle
execute at @s run stopsound @a[distance=..16] * minecraft:item.armor.equip_chain