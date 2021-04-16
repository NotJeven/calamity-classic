#	Description:
#		makes the aqua team 'ready'
#	Activator:
#		@a[scores={triggerTeamReady=1},team=a]
#	Parents:
#		calamity:tick


execute if score #teamReadyA var = #NOTREADY var run scoreboard players operation #teamReadyA var = #TURNREADY var
execute if score #teamReadyA var = #READY var run scoreboard players operation #teamReadyA var = #TURNNOTREADY var

# flavour
execute if score #teamReadyA var = #TURNREADY var run tellraw @a[team=a] [{"text":"Your team is ","color":"white"},{"text":"ready","color":"green"},{"text":"."}]
execute if score #teamReadyA var = #TURNREADY var run title @a[team=a] subtitle [{"text":"Your team is ","color":"white"},{"text":"ready","color":"green"},{"text":"."}]
execute if score #teamReadyA var = #TURNREADY var run title @a[team=a] title ""
execute if score #teamReadyA var = #TURNREADY var run playsound minecraft:item.trident.throw master @a[team=a] ~ ~ ~ 1 1 1
execute if score #teamReadyA var = #TURNREADY var run team join ready §nBlue

execute if score #teamReadyA var = #TURNNOTREADY var run tellraw @a[team=a] [{"text":"Your team is ","color":"white"},{"text":"not ready","color":"red"},{"text":"."}]
execute if score #teamReadyA var = #TURNNOTREADY var run title @a[team=a] subtitle [{"text":"Your team is ","color":"white"},{"text":"not ready","color":"red"},{"text":"."}]
execute if score #teamReadyA var = #TURNNOTREADY var run title @a[team=a] title ""
execute if score #teamReadyA var = #TURNNOTREADY var run playsound minecraft:item.trident.throw master @a[team=a] ~ ~ ~ 1 0 1
execute if score #teamReadyA var = #TURNNOTREADY var run team join notready §nBlue

# toggle
execute if score #teamReadyA var = #TURNREADY var run scoreboard players operation #teamReadyA var = #READY var
execute if score #teamReadyA var = #TURNNOTREADY var run scoreboard players operation #teamReadyA var = #NOTREADY var

# menu
execute if score #menuHidden var = #FALSE var run tag @a[team=a] add menuRequest
execute if entity @a[tag=menuRequest] run function calamity:menu/menu


scoreboard players set @a[scores={triggerTeamReady=1},team=a] triggerTeamReady 0