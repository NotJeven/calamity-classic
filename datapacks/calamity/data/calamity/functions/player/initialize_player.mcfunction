#	Description
#		Initializes a player when they do not have a data file (scoreboard, etc)
# 		Assumes that calamity:init (calamity:var_set) has been run 
#	Activator:
#		@a[tag=!initialized]
#	Parents:
#		calamity:update

# actual function things
gamemode spectator @a[tag=!initialized]
clear @a[tag=!initialized]

scoreboard players operation @a[tag=!initialized] leftPlayer = #FALSE var

scoreboard players operation @a[tag=!initialized] var = #matchID var

# move player
teleport @a[tag=!initialized] 135 60 60 0 30
spawnpoint @a[tag=!initialized] 135 60 60 0

# colourful things
tellraw @a[tag=!initialized] [{"text":"Map: ","color":"white"},{"text":"Calamity Classic","color":"light_purple"}]
tellraw @a[tag=!initialized] [{"text":"Author: ","color":"white"},{"text":"Jeven, Moesh","color":"light_purple"}]
tellraw @a[tag=!initialized] [{"text":"Download: ","color":"white"},{"text":"notjeven.github.io/calamity-classic ","color":"light_purple","clickEvent":{"action":"open_url","value":"https://notjeven.github.io/calamity-classic"},"clickEvent":{"action":"open_url","value":"https://notjeven.github.io/calamity-classic"},"hoverEvent":{"action":"show_text","value":"Go to the Calamity Classic webpage."}},{"text":"↗","color":"light_purple","underlined":"true","hoverEvent":{"action":"show_text","value":"Go to the Calamity Classic web page."},"clickEvent":{"action":"open_url","value":"https://notjeven.github.io/calamity-classic"}}]
tellraw @a[tag=!initialized] ""
tellraw @a[tag=!initialized] [{"text":"Access the chat menu with '"},{"keybind":"key.chat","color":"red"},{"text":"' and click an option."}]
tellraw @a[tag=!initialized] ""
tellraw @a[tag=!initialized,tag=!menuAdmin] [{"text":"Identify as a server "},{"text":"admin","color":"gold","underlined":"true","clickEvent":{"action":"run_command","value":"/execute if entity @s[tag=!menuAdmin] run function calamity:menu/add_admin"},"hoverEvent":{"action":"show_text","value":"Identify yourself as a server admin for advanced options.\nAccessible for players with server operator status only."}},{"text":"."}]
tellraw @a[tag=!initialized,tag=menuAdmin] [{"text":"You are a server "},{"text":"admin","color":"gold"},{"text":". "},{"text":"Remove","color":"red","underlined":"true","clickEvent":{"action":"run_command","value":"/trigger triggerAdmin set 1"},"hoverEvent":{"action":"show_text","value":"Remove admin status and the admin menu.\nAccessible to players without server operator status."}},{"text":" admin status.","color":"white","underlined":"false"}]
scoreboard players enable @a[tag=initialized,tag=menuAdmin] triggerAdmin
playsound minecraft:entity.blaze.ambient master @a[tag=!initialized] ~ ~ ~ 1 1 1

tag @a[tag=!initialized,tag=menuAdmin] add menuRequest
execute if score #menuHidden var = #FALSE var run tag @a[tag=!initialized,tag=!menuRequest] add menuRequest

# set the player as inititialized 
tag @a[tag=!initialized] add initialized