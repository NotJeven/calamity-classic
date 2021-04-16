#	Description:
#		starts the countdown sequence to start the game
#	Activator:
#		if #gameState = #IDLE if #teamReadyPurple = #READY if #teamReadyAqua = #READY
#	Parents:
#		calamity:tick

tellraw @a [{"text":"The match will ","color":"white"},{"text":"start","color":"green"},{"text":" in...","color":"white"}]

scoreboard players operation #gameState var = #COUNTDOWN var

scoreboard players operation #gameCountdown var = #COUNTDOWNTIME var
scoreboard players operation #gameCountdown var -= #1 var

# move players to boxes
gamemode survival @a[team=a]
gamemode survival @a[team=b]

effect give @a[team=a] minecraft:weakness 10 200 true
effect give @a[team=a] minecraft:jump_boost 10 200 true
effect give @a[team=a] minecraft:slowness 10 7 true
effect give @a[team=b] minecraft:weakness 10 200 true
effect give @a[team=b] minecraft:jump_boost 10 200 true
effect give @a[team=b] minecraft:slowness 10 7 true

teleport @a[team=a] 159 44 80
teleport @a[team=b] 113 44 80