##
 # south.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
#if interacted with head
execute as @s[tag=pbroll.interaction.bedroll.south.head] at @s positioned ~ ~ ~1 run kill @e[tag=pbroll.interaction.bedroll.south.feet,distance=..0.1,limit=1,sort=nearest]
execute as @s[tag=pbroll.interaction.bedroll.south.head] at @s positioned ~-0.5 ~ ~-0.5 run kill @e[tag=pbroll.block_display.bedroll,distance=..0.1,limit=6,sort=nearest]


#if interacted with feet
execute as @s[tag=pbroll.interaction.bedroll.south.feet] at @s positioned ~ ~ ~-1 run kill @e[tag=pbroll.interaction.bedroll.south.head,distance=..0.1,limit=1,sort=nearest]
execute as @s[tag=pbroll.interaction.bedroll.south.feet] at @s positioned ~-0.5 ~ ~-1.5 run kill @e[tag=pbroll.block_display.bedroll,distance=..0.1,limit=6,sort=nearest]

execute as @s[tag=pbroll.interaction.bedroll.white] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/white
execute as @s[tag=pbroll.interaction.bedroll.light_gray] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/light_gray
execute as @s[tag=pbroll.interaction.bedroll.gray] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/gray
execute as @s[tag=pbroll.interaction.bedroll.black] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/black
execute as @s[tag=pbroll.interaction.bedroll.brown] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/brown
execute as @s[tag=pbroll.interaction.bedroll.red] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/red
execute as @s[tag=pbroll.interaction.bedroll.orange] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/orange
execute as @s[tag=pbroll.interaction.bedroll.yellow] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/yellow
execute as @s[tag=pbroll.interaction.bedroll.lime] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/lime
execute as @s[tag=pbroll.interaction.bedroll.green] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/green
execute as @s[tag=pbroll.interaction.bedroll.cyan] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/cyan
execute as @s[tag=pbroll.interaction.bedroll.light_blue] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/light_blue
execute as @s[tag=pbroll.interaction.bedroll.blue] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/blue
execute as @s[tag=pbroll.interaction.bedroll.purple] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/purple
execute as @s[tag=pbroll.interaction.bedroll.magenta] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/magenta
execute as @s[tag=pbroll.interaction.bedroll.pink] at @s run loot spawn ~ ~0.2 ~ loot pbroll:rolls/pink

kill @s