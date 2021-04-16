#	Description:
#		handles a player when they respawn
#	Activator:
#		@a[score={sinceDeath=1..},tag=dead]
#	Parents:
#		calamity:tick

# effects
effect give @a[tag=dead,scores={sinceDeath=1..}] minecraft:night_vision 99999 0 true
effect give @a[tag=dead,scores={sinceDeath=1..}] minecraft:absorption 8 2 true

execute if score #gameState var = #IDLE var run gamemode spectator @a[tag=dead,scores={sinceDeath=1..},gamemode=!spectator]
execute if score #gameState var = #END var run gamemode spectator @a[tag=dead,scores={sinceDeath=1..},gamemode=!spectator]
execute if score #gameState var = #RUNNING var run gamemode survival @a[tag=dead,scores={sinceDeath=1..},team=a,gamemode=!survival]
execute if score #gameState var = #RUNNING var run gamemode survival @a[tag=dead,scores={sinceDeath=1..},team=b,gamemode=!survival]
execute if score #gameState var = #RUNNING var run gamemode spectator @a[tag=dead,scores={sinceDeath=1..},team=spectator,gamemode=!spectator]
execute if score #gameState var = #RUNNING var run gamemode spectator @a[tag=dead,scores={sinceDeath=1..},team=,gamemode=!spectator]
execute if score #gameState var = #COUNTDOWN var run gamemode survival @a[tag=dead,scores={sinceDeath=1..},team=a,gamemode=!survival]
execute if score #gameState var = #COUNTDOWN var run gamemode survival @a[tag=dead,scores={sinceDeath=1..},team=b,gamemode=!survival]
execute if score #gameState var = #COUNTDOWN var run gamemode spectator @a[tag=dead,scores={sinceDeath=1..},team=spectator,gamemode=!spectator]
execute if score #gameState var = #COUNTDOWN var run gamemode spectator @a[tag=dead,scores={sinceDeath=1..},team=,gamemode=!spectator]

tag @a[scores={sinceDeath=1..},tag=dead] remove dead