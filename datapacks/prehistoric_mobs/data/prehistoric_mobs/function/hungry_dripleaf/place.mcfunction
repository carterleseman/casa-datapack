execute at @s align xyz positioned ~.5 ~ ~.5 if block ~ ~ ~ #minecraft:replaceable run return 1
execute at @s run tp @s ~ ~1 ~
execute at @s run rotate @s facing entity @p feet
function prehistoric_mobs:hungry_dripleaf/place