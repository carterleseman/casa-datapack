# tellraw @p "afk_sleep DEBUG Player is in bed"

scoreboard players operation #prevPlayersSleepingPercentage afk_sleep.dummy = .playersSleepingPercentage afk_sleep.dummy

execute store result score .gameruleValue afk_sleep.dummy run gamerule playersSleepingPercentage
execute unless score .gameruleValue afk_sleep.dummy = .playersSleepingPercentage afk_sleep.dummy run scoreboard players operation .relativePercentage afk_sleep.dummy = .gameruleValue afk_sleep.dummy

function afk_sleep:internal/while_sleeping/calculate
execute in minecraft:overworld unless score .playersSleepingPercentage afk_sleep.dummy = #prevPlayersSleepingPercentage afk_sleep.dummy run function afk_sleep:internal/players_sleeping_percentage/set

# tellraw @p "afk_sleep DEBUG Scheduling Next Check"

execute as @r[predicate=pbroll:is_in_overworld] if predicate pbroll:sleepy_time if score .playersSleepingPercentage afk_sleep.dummy >= .relativePercentage afk_sleep.dummy run function pbroll:interacted/skip_night

schedule function pbroll:afk_sleep/check 10t