scoreboard players set #10k tmbr.tmp 10000

scoreboard players operation #remaining tmbr.tmp *= #10k tmbr.tmp
scoreboard players operation #remaining tmbr.tmp /= #max tmbr.tmp


item modify entity @s weapon.mainhand timber:reduce_durability