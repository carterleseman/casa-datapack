#rotationData
execute unless entity @e[type=armor_stand,tag=select,distance=..20.5] if entity @s[tag=!active] store result entity @e[type=minecraft:armor_stand,tag=owlstand,limit=1,sort=nearest] Rotation[0] float 1 run data get entity @s Rotation[0]

#flyingAnimation
# OLD
# execute if data entity @e[sort=nearest,limit=1,type=armor_stand,tag=owlstand] {equipment:{head:{id:"minecraft:paper",Count:1b}}} run item replace entity @e[sort=nearest,limit=1,type=armor_stand,tag=owlstand] armor.head with sunflower[item_model="owls:owl_flying_default"]

execute if items entity @e[sort=nearest,limit=1,type=minecraft:armor_stand,tag=owlstand] armor.head minecraft:paper run item replace entity @e[sort=nearest,limit=1,type=armor_stand,tag=owlstand] armor.head with minecraft:sunflower[minecraft:item_model="owls:owl_flying_default"]

#defaultAnimation

# OLD
# execute if data entity @e[sort=nearest,limit=1,type=armor_stand,tag=owlstand] {equipment:{head:{id:"minecraft:sunflower",Count:1b,components:{"minecraft:item_model":"owls:owl_default"}}}} if block ~ ~-.1 ~ #owls:spawn_blocks run item replace entity @e[sort=nearest,limit=1,type=armor_stand,tag=owlstand] armor.head with sunflower[item_model="owls:owl_flying_default"]

execute if items entity @e[sort=nearest,limit=1,type=minecraft:armor_stand,tag=owlstand] armor.head minecraft:sunflower[minecraft:item_model="owls:owl_default"] if block ~ ~-.1 ~ #owls:spawn_blocks run item replace entity @e[sort=nearest,limit=1,type=minecraft:armor_stand,tag=owlstand] armor.head with minecraft:sunflower[minecraft:item_model="owls:owl_flying_default"]

# OLD
# execute if data entity @e[sort=nearest,limit=1,type=armor_stand,tag=owlstand] {equipment:{head:{id:"minecraft:sunflower",Count:1b,components:{"minecraft:item_model":"owls:owl_flying_default"}}}} unless block ~ ~-.1 ~ #owls:spawn_blocks run item replace entity @e[sort=nearest,limit=1,type=armor_stand,tag=owlstand] armor.head with sunflower[item_model="owls:owl_default"]

execute if items entity @e[sort=nearest,limit=1,type=minecraft:armor_stand,tag=owlstand] armor.head minecraft:sunflower[minecraft:item_model="owls:owl_flying_default"] unless block ~ ~-.1 ~ #owls:spawn_blocks run item replace entity @e[sort=nearest,limit=1,type=minecraft:armor_stand,tag=owlstand] armor.head with minecraft:sunflower[minecraft:item_model="owls:owl_default"]

#snowyAnimation

# OLD
# execute if data entity @e[sort=nearest,limit=1,type=armor_stand,tag=owlstand] {equipment:{head:{id:"minecraft:sunflower",Count:1b,components:{"minecraft:item_model":"owls:owl_snowy"}}}} if block ~ ~-.1 ~ #owls:spawn_blocks run item replace entity @e[sort=nearest,limit=1,type=armor_stand,tag=owlstand] armor.head with sunflower[item_model="owls:owl_flying_snowy"]

execute if items entity @e[sort=nearest,limit=1,type=minecraft:armor_stand,tag=owlstand] armor.head minecraft:sunflower[minecraft:item_model="owls:owl_snowy"] if block ~ ~.1 ~ #owls:spawn_blocks run item replace entity @e[sort=nearest,limit=1,type=minecraft:armor_stand,tag=owlstand] armor.head with minecraft:sunflower[minecraft:item_model="owls:owl_flying_snowy"]

# OLD
# execute if data entity @e[sort=nearest,limit=1,type=armor_stand,tag=owlstand] {equipment:{head:{id:"minecraft:sunflower",Count:1b,components:{"minecraft:item_model":"owls:owl_flying_snowy"}}}} unless block ~ ~-.1 ~ #owls:spawn_blocks run item replace entity @e[sort=nearest,limit=1,type=armor_stand,tag=owlstand] armor.head with sunflower[item_model="owls:owl_snowy"]

execute if items entity @e[sort=nearest,limit=1,type=minecraft:armor_stand,tag=owlstand] armor.head minecraft:sunflower[minecraft:item_model="owls:owl_flying_snowy"] unless block ~ ~-.1 ~ #owls:spawn_blocks run item replace entity @e[sort=nearest,limit=1,type=minecraft:armor_stand,tag=owlstand] armor.head with minecraft:sunflower[minecraft:item_model="owls:owl_snowy"]