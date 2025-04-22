# Oak Log
execute as @a[scores={ts.oakmined=1}] at @s if entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] unless predicate timberstrike:shift if items entity @s weapon.mainhand #minecraft:axes run execute at @e[type=item,limit=1,sort=nearest,nbt={Age:0s}] positioned ~ ~ ~ run function timberstrike:mine/azalea
execute as @a[scores={ts.oakmined=1}] at @s unless items entity @s weapon.mainhand #minecraft:axes run scoreboard players reset @s ts.oakmined

# Spruce Log
execute as @a[scores={ts.sprucemined=1}] if entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] unless predicate timberstrike:shift at @s if items entity @s weapon.mainhand #minecraft:axes run execute at @e[type=item,limit=1,sort=nearest,nbt={Age:0s}] positioned ~ ~ ~ run function timberstrike:mine/tree {wood:"spruce"}
execute as @a[scores={ts.sprucemined=1}] at @s unless items entity @s weapon.mainhand #minecraft:axes run scoreboard players reset @s ts.sprucemined

# Birch Log
execute as @a[scores={ts.birchmined=1}] if entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] unless predicate timberstrike:shift at @s if items entity @s weapon.mainhand #minecraft:axes run execute at @e[type=item,limit=1,sort=nearest,nbt={Age:0s}] positioned ~ ~ ~ run function timberstrike:mine/tree {wood:"birch"}
execute as @a[scores={ts.birchmined=1}] at @s unless items entity @s weapon.mainhand #minecraft:axes run scoreboard players reset @s ts.birchmined

# Jungle Log
execute as @a[scores={ts.junglemined=1}] if entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] unless predicate timberstrike:shift at @s if items entity @s weapon.mainhand #minecraft:axes run execute at @e[type=item,limit=1,sort=nearest,nbt={Age:0s}] positioned ~ ~ ~ run function timberstrike:mine/tree {wood:"jungle"}
execute as @a[scores={ts.junglemined=1}] at @s unless items entity @s weapon.mainhand #minecraft:axes run scoreboard players reset @s ts.junglemined

# Acacia Log
execute as @a[scores={ts.acaciamined=1}] if entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] unless predicate timberstrike:shift at @s if items entity @s weapon.mainhand #minecraft:axes run execute at @e[type=item,limit=1,sort=nearest,nbt={Age:0s}] positioned ~ ~ ~ run function timberstrike:mine/tree {wood:"acacia"}
execute as @a[scores={ts.acaciamined=1}] at @s unless items entity @s weapon.mainhand #minecraft:axes run scoreboard players reset @s ts.acaciamined

# Dark Oak Log
execute as @a[scores={ts.dark_oakmined=1}] if entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] unless predicate timberstrike:shift at @s if items entity @s weapon.mainhand #minecraft:axes run execute at @e[type=item,limit=1,sort=nearest,nbt={Age:0s}] positioned ~ ~ ~ run function timberstrike:mine/tree {wood:"dark_oak"}
execute as @a[scores={ts.dark_oakmined=1}] at @s unless items entity @s weapon.mainhand #minecraft:axes run scoreboard players reset @s ts.darkoakmined

# Mangrove Log
execute as @a[scores={ts.mangrovemined=1}] if entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] unless predicate timberstrike:shift at @s if items entity @s weapon.mainhand #minecraft:axes run execute at @e[type=item,limit=1,sort=nearest,nbt={Age:0s}] positioned ~ ~ ~ run function timberstrike:mine/tree {wood:"mangrove"}
execute as @a[scores={ts.mangrovemined=1}] at @s unless items entity @s weapon.mainhand #minecraft:axes run scoreboard players reset @s ts.mangrovemined

# Cherry Log
execute as @a[scores={ts.cherrymined=1}] if entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] unless predicate timberstrike:shift at @s if items entity @s weapon.mainhand #minecraft:axes run execute at @e[type=item,limit=1,sort=nearest,nbt={Age:0s}] positioned ~ ~ ~ run function timberstrike:mine/tree {wood:"cherry"}
execute as @a[scores={ts.cherrymined=1}] at @s unless items entity @s weapon.mainhand #minecraft:axes run scoreboard players reset @s ts.cherrymined

# Warped Hyphae
execute as @a[scores={ts.warpedmined=1}] if entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] unless predicate timberstrike:shift at @s if items entity @s weapon.mainhand #minecraft:axes run execute at @e[type=item,limit=1,sort=nearest,nbt={Age:0s}] positioned ~ ~ ~ run function timberstrike:mine/nether_fungi {fungi:"warped",wart:"warped"}
execute as @a[scores={ts.warpedmined=1}] at @s unless items entity @s weapon.mainhand #minecraft:axes run scoreboard players reset @s ts.warpedmined

# Crimson stem
execute as @a[scores={ts.crimsonmined=1}] if entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] unless predicate timberstrike:shift at @s if items entity @s weapon.mainhand #minecraft:axes run execute at @e[type=item,limit=1,sort=nearest,nbt={Age:0s}] positioned ~ ~ ~ run function timberstrike:mine/nether_fungi {fungi:"crimson",wart:"nether"}
execute as @a[scores={ts.crimsonmined=1}] at @s unless items entity @s weapon.mainhand #minecraft:axes run scoreboard players reset @s ts.crimsonmined

# mushroom stem
execute unless score enable_giant_mushrooms ts.config matches 0 as @a[scores={ts.mushroommined=1}] if entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] unless predicate timberstrike:shift at @s if items entity @s weapon.mainhand #minecraft:axes run execute at @e[type=item,limit=1,sort=nearest,nbt={Age:0s}] positioned ~ ~ ~ run function timberstrike:mine/mushroom
execute as @a[scores={ts.mushroommined=1}] at @s unless items entity @s weapon.mainhand #minecraft:axes run scoreboard players reset @s ts.mushroommined
execute if score enable_giant_mushrooms ts.config matches 0 as @a[scores={ts.mushroommined=1}] at @s run scoreboard players reset @s ts.mushroommined

# Pale Oak Log
execute as @a[scores={ts.pale_oakmined=1}] if entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] unless predicate timberstrike:shift at @s if items entity @s weapon.mainhand #minecraft:axes run execute at @e[type=item,limit=1,sort=nearest,nbt={Age:0s}] positioned ~ ~ ~ run function timberstrike:mine/tree {wood:"pale_oak"}
execute as @a[scores={ts.pale_oakmined=1}] at @s unless items entity @s weapon.mainhand #minecraft:axes run scoreboard players reset @s ts.pale_oakmined


execute as @a unless entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] run scoreboard players reset @s ts.oakmined
execute as @a unless entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] run scoreboard players reset @s ts.sprucemined
execute as @a unless entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] run scoreboard players reset @s ts.birchmined
execute as @a unless entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] run scoreboard players reset @s ts.junglemined
execute as @a unless entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] run scoreboard players reset @s ts.acaciamined
execute as @a unless entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] run scoreboard players reset @s ts.dark_oakmined
execute as @a unless entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] run scoreboard players reset @s ts.mangrovemined
execute as @a unless entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] run scoreboard players reset @s ts.cherrymined
execute as @a unless entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] run scoreboard players reset @s ts.warpedmined
execute as @a unless entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] run scoreboard players reset @s ts.crimsonmined
execute as @a unless entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] run scoreboard players reset @s ts.mushroommined
execute as @a unless entity @s[nbt={SelectedItem:{components:{"minecraft:enchantments":{"timberstrikeenchantment:timberstrike":1}}}}] run scoreboard players reset @s ts.pale_oakmined

