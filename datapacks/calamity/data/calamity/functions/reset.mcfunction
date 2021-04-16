#	Description:
#		resets the map and transitions game to IDLE gamestate
#	Activator:
#		None
#	Parents:
#		calamity:tick, calamity:game/reset_auto_tick

tellraw @s [{"text":"Please wait while the map resets...","color":"gray"}]


# var set also sets gamestate to idle and generates new matchID
function calamity:var_set

# entity and player things
kill @e[type=arrow]
kill @e[type=item]
kill @e[type=experience_orb]

# generic player handling 
team leave @a[team=!spectator]
gamemode spectator @a[gamemode=!spectator]
scoreboard players operation @a var = #matchID var
execute if score #menuHidden var = #FALSE var run tag @a add menuRequest
clear @a[team=!spectator]

# this line needs to place new map blocks ..... function calamity:clone
# this line needs to load the tooltips with the map function ..... classic:tooltip_create

tellraw @a ""
tellraw @a [{"text":"The map has been "},{"text":"reset","color":"light_purple"},{"text":".","color":"white"}]
title @a subtitle [{"text":"The map has been "},{"text":"reset","color":"light_purple"},{"text":".","color":"white"}]
title @a title ""
playsound minecraft:entity.cat.ambient master @a ~ ~ ~ 99 0 1