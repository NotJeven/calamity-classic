#	Description:
#		team join handler for team b
#	Activator:
#		@a[scores={triggerTeamJoin=2}]
#	Parents:
#		calamity:tick


team join b @a[scores={triggerTeamJoin=2}]
clear @a[scores={triggerTeamJoin=2}]
spawnpoint @a[scores={triggerTeamJoin=2}] 113 44 80

# flavour
tellraw @a[scores={triggerTeamJoin=2}] [{"text":"You rallied with the ","color":"white"},{"text":"Yellow","color":"yellow"},{"text":" banners.","color":"white"}]
title @a[scores={triggerTeamJoin=2}] subtitle [{"text":"You rallied with the ","color":"white"},{"text":"Yellow","color":"yellow"},{"text":" banners.","color":"white"}]
title @a[scores={triggerTeamJoin=2}] title ""
playsound entity.horse.armor master @a[scores={triggerTeamJoin=2}] ~ ~ ~ 1 1 1
scoreboard players set @a[scores={triggerTeamJoin=2}] sidebarDisplay 2

# menu
execute if score #menuHidden var = #FALSE var run tag @a[scores={triggerTeamJoin=2}] add menuRequest
execute if entity @a[tag=menuRequest] run function calamity:menu/menu

scoreboard players set @a[scores={triggerTeamJoin=2}] triggerTeamJoin 0