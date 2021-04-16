#	Description:
#		main game and logic loop
#	Activator:
#		none
#	Parents:
#		minecraft:tick

# Let them eat cake!
effect give @a[scores={food=..19}] minecraft:saturation 1 0 false
effect clear @a[scores={food=20}] minecraft:saturation

# deal with leaving players, first out of date ones
execute as @a[tag=initialized,scores={leftPlayer=1..}] unless score @s var = #matchID var run tag @s remove initialized
execute if entity @a[tag=initialized,scores={leftPlayer=1..}] run function calamity:player/left_player

# deal with new players when they log in for the first time
execute if entity @a[tag=!initialized] run function calamity:player/initialize_player

# death handlers
tag @a[scores={sinceDeath=0},tag=!dead] add dead
execute if entity @a[scores={sinceDeath=1..},tag=dead] run function calamity:player/alive

# Menu Requests
tag @a[x=495,y=50,z=0,distance=0..1,tag=!menuRequest,tag=!menuTimeout] add menuRequest
execute if entity @a[tag=menuRequest,tag=!menuTimeout] if score #menuHidden var = #FALSE var if score #gameState var = #IDLE var run function calamity:menu/menu
execute if entity @a[tag=menuRequest,tag=menuAdmin,tag=!menuTimeout] if score #menuHidden var = #TRUE var run function calamity:menu/menu_admin
execute if entity @a[tag=menuRequest,tag=menuAdmin,tag=!menuTimeout] if score #menuHidden var = #FALSE var unless score #gameState var = #IDLE var run function calamity:menu/menu_admin
tag @a[x=495,y=50,z=0,distance=0..1] add menuTimeout
tag @a[x=495,y=50,z=0,distance=2..,tag=menuTimeout] remove menuTimeout

# Menu actions
execute if entity @a[scores={triggerTeamJoin=-1}] run function calamity:menu/team_leave
execute if entity @a[scores={triggerTeamJoin=1}] run function calamity:menu/team_join_a
execute if entity @a[scores={triggerTeamJoin=2}] run function calamity:menu/team_join_b
execute if entity @a[scores={triggerTeamJoin=3}] run function calamity:menu/team_join_spectator
execute if entity @a[scores={triggerTeamReady=1},team=a] run function calamity:menu/team_ready_a
execute if entity @a[scores={triggerTeamReady=1},team=b] run function calamity:menu/team_ready_b
execute if entity @a[scores={triggerTeamReady=1},team=spectator] run function calamity:menu/team_ready_spectator
execute if entity @a[scores={triggerAdmin=1}] run function calamity:menu/remove_admin

# start/stop the game
execute if score #teamReadyA var = #READY var if score #teamReadyB var = #READY var if score #teamReadySpectator var = #READY var if score #gameState var = #IDLE var run function calamity:game/countdown_start
execute if score #gameState var = #COUNTDOWN var if score #teamReadyB var = #NOTREADY var run function calamity:game/countdown_stop
execute if score #gameState var = #COUNTDOWN var if score #teamReadyA var = #NOTREADY var run function calamity:game/countdown_stop
execute if score #gameState var = #COUNTDOWN var if score #teamReadySpectator var = #NOTREADY var run function calamity:game/countdown_stop

execute if score #gameState var = #COUNTDOWN var if score #gameCountdown var < #COUNTDOWNTIME var run function calamity:game/countdown_tick

# game win condition
#execute if score #gameState var = #RUNNING var  run function calamity:game/end
#execute if score #gameState var = #RUNNING var  run function calamity:game/end

# end game stats
execute if score #gameState var = #END var if score #statTime var = #STATLENGTH var run function calamity:game/stat_next
execute if score #gameState var = #END var run scoreboard players add #statTime var 1

# auto reset 
execute if score #gameState var = #END var if score #autoReset var = #TRUE var run function calamity:game/reset_auto_tick

# too far away from map
teleport @a[x=135,y=60,z=145,distance=275..,gamemode=spectator] 135 60 60 0 0

# pad trigger rewrite
execute as @e[tag=pad,tag=!padTriggered] at @s if block ~ ~ ~ #minecraft:pressure_plates[powered=true] run function calamity:pad/triggered
execute as @e[tag=pad,tag=padTriggered] at @s unless block ~ ~ ~ #minecraft:pressure_plates[powered=true] run tag @s remove padTriggered

# pad lights; I don't like any of this
execute as @e[tag=minorPad] if score @s var = #MINORPADL1 var at @s run fill ^2 ^-1 ^3 ^2 ^-1 ^3 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=minorPad] if score @s var = #MINORPADL2 var at @s run fill ^1 ^-1 ^3 ^1 ^-1 ^3 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=minorPad] if score @s var = #MINORPADL3 var at @s run fill ^0 ^-1 ^3 ^0 ^-1 ^3 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=minorPad] if score @s var = #MINORPADL4 var at @s run fill ^1 ^-1 ^3 ^1 ^-1 ^3 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=minorPad] if score @s var = #MINORPADL5 var at @s run fill ^2 ^-1 ^3 ^2 ^-1 ^3 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=minorPad] if score @s var = #MINORPADL6 var at @s run fill ^2 ^-1 ^3 ^2 ^-1 ^3 minecraft:redstone_lamp[lit=false] replace minecraft:redstone_lamp

execute as @e[tag=majorPad] if score @s var = #MAJORPADL1 var at @s run fill ^3 ^-1 ^6 ^3 ^-1 ^6 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=majorPad] if score @s var = #MAJORPADL2 var at @s run fill ^2 ^-1 ^6 ^2 ^-1 ^6 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=majorPad] if score @s var = #MAJORPADL3 var at @s run fill ^1 ^-1 ^6 ^1 ^-1 ^6 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=majorPad] if score @s var = #MAJORPADL4 var at @s run fill ^0 ^-1 ^6 ^0 ^-1 ^6 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=majorPad] if score @s var = #MAJORPADL5 var at @s run fill ^-1 ^-1 ^6 ^-1 ^-1 ^6 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=majorPad] if score @s var = #MAJORPADL6 var at @s run fill ^-2 ^-1 ^6 ^-2 ^-1 ^6 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=majorPad] if score @s var = #MAJORPADL7 var at @s run fill ^-3 ^-1 ^6 ^-3 ^-1 ^6 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=majorPad] if score @s var = #MAJORPADL8 var at @s run fill ^-2 ^-1 ^6 ^-2 ^-1 ^6 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=majorPad] if score @s var = #MAJORPADL9 var at @s run fill ^-1 ^-1 ^6 ^-1 ^-1 ^6 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=majorPad] if score @s var = #MAJORPADL10 var at @s run fill ^0 ^-1 ^6 ^0 ^-1 ^6 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=majorPad] if score @s var = #MAJORPADL11 var at @s run fill ^1 ^-1 ^6 ^1 ^-1 ^6 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=majorPad] if score @s var = #MAJORPADL12 var at @s run fill ^2 ^-1 ^6 ^2 ^-1 ^6 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=majorPad] if score @s var = #MAJORPADL13 var at @s run fill ^3 ^-1 ^6 ^3 ^-1 ^6 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
execute as @e[tag=majorPad] if score @s var = #MAJORPADL14 var at @s run fill ^3 ^-1 ^6 ^3 ^-1 ^6 minecraft:redstone_lamp[lit=false] replace minecraft:redstone_lamp

# pad summon
execute as @e[tag=minorPad] if score @s var = #MINORSUMMON var run function calamity:pad/summon
execute as @e[tag=majorPad] if score @s var = #MAJORSUMMON var run function calamity:pad/summon

# pad ticks
execute if score #gameState var = #RUNNING var run scoreboard players add @e[tag=minorPad,scores={var=1..}] var 1
execute if score #gameState var = #RUNNING var run scoreboard players add @e[tag=majorPad,scores={var=1..}] var 1
execute as @e[tag=minorPad] if score @s var > #MINORCOOLDOWN var run scoreboard players set @s var 0
execute as @e[tag=majorPad] if score @s var > #MAJORCOOLDOWN var run scoreboard players set @s var 0

# pad sounds
execute as @e[tag=itemPad] at @s positioned ~ ~3 ~ if score @s var = #MINORSUMMON var run playsound minecraft:entity.evoker.prepare_summon master @a[team=!b,distance=..5] ~ ~ ~ 0.5 2 0
execute as @e[tag=itemPad,tag=rightLane] at @s positioned ~ ~3 ~ if score @s var = #MINORSUMMON var run playsound minecraft:entity.evoker.prepare_summon master @a[team=!a,distance=..5] ~ ~ ~ 0.5 2 0
execute as @e[tag=minorPad,tag=a] at @s positioned ~ ~3 ~ if score @s var = #MINORPADL3 var run playsound minecraft:block.bell.resonate master @a[team=!b,distance=..5] ~ ~ ~ 0.2 1.5 0
execute as @e[tag=minorPad,tag=b] at @s positioned ~ ~3 ~ if score @s var = #MINORPADL3 var run playsound minecraft:block.bell.resonate master @a[team=!a,distance=..5] ~ ~ ~ 0.2 1.5 0
# drink
execute if score @e[tag=pad5,limit=1] var = #MINORSUMMON var at @e[tag=pad5,limit=1] positioned ~-2 ~2 ~-2 if entity @a[team=b,dx=3,dy=1,dz=3] run playsound minecraft:entity.generic.drink master @a[team=!a] ~ ~ ~ 1 1 1
execute if score @e[tag=pad6,limit=1] var = #MINORSUMMON var at @e[tag=pad6,limit=1] positioned ~-2 ~2 ~-2 if entity @a[team=b,dx=3,dy=1,dz=3] run playsound minecraft:entity.generic.drink master @a[team=!a] ~ ~ ~ 1 1 1
execute if score @e[tag=pad11,limit=1] var = #MINORSUMMON var at @e[tag=pad11,limit=1] positioned ~-2 ~2 ~-2 if entity @a[team=a,dx=3,dy=1,dz=3] run playsound minecraft:entity.generic.drink master @a[team=!b] ~ ~ ~ 1 1 1
execute if score @e[tag=pad12,limit=1] var = #MINORSUMMON var at @e[tag=pad12,limit=1] positioned ~-2 ~2 ~-2 if entity @a[team=a,dx=3,dy=1,dz=3] run playsound minecraft:entity.generic.drink master @a[team=!b] ~ ~ ~ 1 1 1
# major
execute as @e[tag=majorPad] at @s positioned ~ ~3 ~ if score @s var = #MAJORSUMMON var run playsound minecraft:entity.evoker.prepare_summon master @a ~ ~ ~ 1.25 1.25 0
execute as @e[tag=majorPad] at @s positioned ~ ~3 ~ if score @s var = #MAJORSOUND var run playsound minecraft:block.bell.resonate master @a ~ ~ ~ 1.25 0 0

# teleports
execute as @e[tag=teleEnd,tag=a] at @s run teleport @a[distance=..0.5,team=a] @e[sort=nearest,limit=1,tag=teleMidExit]
execute as @e[tag=teleMid,tag=a] at @s run teleport @a[distance=..0.5,team=a] @e[sort=nearest,limit=1,tag=teleExit]

execute as @e[tag=teleEnd,tag=b] at @s run teleport @a[distance=..0.5,team=b] @e[sort=nearest,limit=1,tag=teleMidExit]
execute as @e[tag=teleMid,tag=b] at @s run teleport @a[distance=..0.5,team=b] @e[sort=nearest,limit=1,tag=teleExit]

# clear objective area

# if the pad objects die for some reason....
execute if score #padCount var > #0 var run scoreboard players set #padCount var 0
execute as @e[tag=pad] run scoreboard players add #padCount var 1
# this is going to be map specific I think ..... execute unless score #padCount var = #PADS var run function classic:pad_objects

# map bounds; toggleBounds = true when confirmed outside of play area
# I want the map height to be y=68
tag @a[tag=inBounds] remove inBounds

execute as @a[team=!,tag=!inBounds] at @s if entity @s[y=0,dy=66] if block ~ 255 ~ minecraft:barrier run tag @s add inBounds
# in bounds but confirmed outside
execute as @a[team=!,tag=inBounds,tag=toggleBounds] if entity @s run function calamity:in_bounds
# outside bounds but not confirmed
execute as @a[team=!,tag=!inBounds,tag=!toggleBounds] if entity @s run function calamity:out_bounds
# still outside
execute as @a[team=!,tag=!inBounds,tag=toggleBounds] if entity @s run title @s actionbar [{"text":"←","color":"dark_red"},{"text":" outside building area ","color":"white"},{"text":"→","color":"dark_red"}]

# objective boss bars
execute if score #gameState var = #RUNNING var store result bossbar calamity:left value run data get entity @e[tag=leftObjective,limit=1] Health
execute if score #gameState var = #RUNNING var store result bossbar calamity:right value run data get entity @e[tag=rightObjective,limit=1] Health

# make spawn safe
fill 159 44 80 159 45 80 minecraft:air
fill 113 44 80 113 45 80 minecraft:air
