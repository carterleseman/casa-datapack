tag @s add traveler

data modify entity @s Offers.Recipes prepend value {buy:{id:"minecraft:emerald",count:10},sell:{id:"minecraft:filled_map",count:1},maxUses:1}

loot replace entity @s weapon.mainhand loot remined:travelers_maps

data modify entity @s Offers.Recipes[0].sell merge from entity @s equipment.mainhand