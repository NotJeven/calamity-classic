#	Description:
#		starts the game
#	Activator:
#		if #gameState = #COUNTDOWN if #gameCountdown < #0 
#	Parents:
#		calamity:game/countdown_tick

tellraw @a [{"text":">>>"},{"text":" Go","color":"green"},{"text":"!","color":"white"}]
tellraw @a ""
playsound minecraft:block.bell.use master @a ~ ~ ~ 1 0 1
playsound minecraft:block.bell.use master @a ~ ~ ~ 1 0 1
playsound minecraft:block.bell.use master @a ~ ~ ~ 1 0 1
playsound minecraft:block.bell.use master @a ~ ~ ~ 1 0 1
playsound minecraft:block.bell.use master @a ~ ~ ~ 1 0 1

scoreboard players operation #gameState var = #RUNNING var

# player things
gamemode survival @a[team=a]
gamemode survival @a[team=b]
effect clear @a minecraft:weakness
effect clear @a minecraft:jump_boost
effect clear @a minecraft:slowness

kill @e[tag=tooltip]

# bossbars visible
bossbar set calamity:left players @a
bossbar set calamity:right players @a

bossbar set calamity:left visible true
bossbar set calamity:right visible true

# menu lockdown
scoreboard players reset @a triggerTeamJoin
scoreboard players reset @a triggerTeamReady

# open the boxes

# set stats
scoreboard players set @a killCount 0
scoreboard players set @a deathCount 0
scoreboard players set @a shotCount 0
scoreboard players set @a damageCount 0
scoreboard players set @a absorbedCount 0
scoreboard players set @a summonCount 0