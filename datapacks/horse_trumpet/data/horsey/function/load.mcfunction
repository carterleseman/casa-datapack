#Scoreboard initial
scoreboard objectives add horsey.main dummy
scoreboard objectives add horsey.leashed dummy
advancement revoke @p only horsey:blown
data merge storage horsey:main {plr_uuid:[]}