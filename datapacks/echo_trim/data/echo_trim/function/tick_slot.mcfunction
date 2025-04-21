execute unless items entity @s armor.* *[minecraft:trim] run return fail

execute store result storage echo_trim:animation prev_index int 1 run scoreboard players get @s echo_trim.prev_animation
execute store result storage echo_trim:animation index int 1 run scoreboard players get @s echo_trim.animation
$data modify storage echo_trim:animation slot set value "$(slot)"
$data modify storage echo_trim:animation pattern set from entity @s $(field).components.minecraft:trim.pattern

function echo_trim:animate_trim with storage echo_trim:animation