data modify storage horsey:main plr_uuid set from entity @p[tag=waiting,limit=1] UUID
execute positioned as @p[tag=waiting,limit=1] run function horsey:trumpet/locate with storage horsey:main

tag @p[tag=waiting,limit=1] add ending
tag @p[tag=waiting,limit=1] remove waiting