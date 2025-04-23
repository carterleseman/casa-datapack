advancement revoke @s only pbroll_msg:sleep

execute if entity @s[tag=sleeping_messages.player.disabled] run return fail

execute if predicate pbroll:is_in_overworld unless predicate pbroll:sleepy_time run return fail
execute if predicate pbroll:is_in_overworld if predicate pbroll:sleepy_time if entity @e[type=#pbroll:monsters,distance=..10] run return fail

function sleeping_messages:message