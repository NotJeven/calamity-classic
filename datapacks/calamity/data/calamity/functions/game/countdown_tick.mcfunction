#	Description:
#		runs when the countdown clock ticks (every game tick while a countdown is true)
#	Activator:
#		#gameState = #COUNTDOWN if #gameCountdown <= #15SECONDS
#	Parents:
#		calamity:tick


# do a tick of feedback (sound, text) every second
scoreboard players operation #gameCountdownSecond var = #gameCountdown var
scoreboard players operation #gameCountdownSecond var %= #1SECOND var
execute if score #gameCountdownSecond var = #0 var if score #gameCountdown var > #0 var run function calamity:game/countdown_second

# start the game!
execute if score #gameState var = #COUNTDOWN var if score #gameCountdown var < #0 var run function calamity:game/start

# decrease the counter
scoreboard players operation #gameCountdown var -= #1 var

