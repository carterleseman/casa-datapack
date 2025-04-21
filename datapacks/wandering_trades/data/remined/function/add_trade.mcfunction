data modify entity @s Offers.Recipes prepend value {buy:{id:"minecraft:pufferfish",count:8},sell:{id:"minecraft:emerald",count:4},maxUses:3}

loot replace entity @s weapon.mainhand loot remined:buy_wander

data modify entity @s Offers.Recipes[0].buy merge from entity @s equipment.mainhand

execute as @s run function remined:add_trade2