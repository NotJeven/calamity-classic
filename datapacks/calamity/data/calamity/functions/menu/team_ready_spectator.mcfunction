#	Description:
#		makes the sqectator team 'ready'
#	Activator:
#		@a[scores={triggerTeamReady=1},team=spectator]
#	Parents:
#		calamity:tick


execute if score #teamReadySpectator var = #NOTREADY var run scoreboard players operation #teamReadySpectator var = #TURNREADY var
execute if score #teamReadySpectator var = #READY var run scoreboard players operation #teamReadySpectator var = #TURNNOTREADY var

# flavour
execute if score #teamReadySpectator var = #TURNREADY var run tellraw @a[team=spectator] [{"text":"Your team is ","color":"white"},{"text":"ready","color":"green"},{"text":"."}]
execute if score #teamReadySpectator var = #TURNREADY var run title @a[team=spectator] subtitle [{"text":"Your team is ","color":"white"},{"text":"ready","color":"green"},{"text":"."}]
execute if score #teamReadySpectator var = #TURNREADY var run title @a[team=spectator] title ""
execute if score #teamReadySpectator var = #TURNREADY var run playsound minecraft:item.trident.throw master @a[team=spectator] ~ ~ ~ 1 1 1
execute if score #teamReadySpectator var = #TURNREADY var run team join ready §nSpectator

execute if score #teamReadySpectator var = #TURNNOTREADY var run tellraw @a[team=spectator] [{"text":"Your team is ","color":"white"},{"text":"not ready","color":"red"},{"text":"."}]
execute if score #teamReadySpectator var = #TURNNOTREADY var run title @a[team=spectator] subtitle [{"text":"Your team is ","color":"white"},{"text":"not ready","color":"red"},{"text":"."}]
execute if score #teamReadySpectator var = #TURNNOTREADY var run title @a[team=spectator] title ""
execute if score #teamReadySpectator var = #TURNNOTREADY var run playsound minecraft:item.trident.throw master @a[team=spectator] ~ ~ ~ 1 0 1
execute if score #teamReadySpectator var = #TURNNOTREADY var run team join notready §nSpectator

# toggle
execute if score #teamReadySpectator var = #TURNREADY var run scoreboard players operation #teamReadySpectator var = #READY var
execute if score #teamReadySpectator var = #TURNNOTREADY var run scoreboard players operation #teamReadySpectator var = #NOTREADY var

# menu
execute if score #menuHidden var = #FALSE var run tag @a[scores={triggerTeamReady=1},team=spectator] add menuRequest
execute if entity @a[tag=menuRequest] run function calamity:menu/menu


scoreboard players set @a[scores={triggerTeamReady=1},team=spectator] triggerTeamReady 0