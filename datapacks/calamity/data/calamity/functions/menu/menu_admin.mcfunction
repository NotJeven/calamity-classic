#	Description:
#		deals an admin menu
#	Activator:
#		@a[tag=menuRequest,tag=menuAdmin]
#	Parents:
#		wildflower:menu/menu
#		wildflower:game/end
#		wildflower:tick
#	even though I copied this from adversity its still wildflower :thinking:


# some padding if menus are hidden and this is not handled by the standard menu
execute if score #menuHidden var = #TRUE var run tellraw @a[tag=menuRequest,tag=menuAdmin] ""
execute if score #menuHidden var = #FALSE var unless score #gameState var = #IDLE var run tellraw @a[tag=menuRequest,tag=menuAdmin] ""

execute if score #menuHidden var = #TRUE var run playsound minecraft:ui.button.click master @a[x=495,y=50,z=0,distance=0..1,tag=menuRequest,tag=menuAdmin,tag=!menuTimeout] ~ ~ ~ 1 0.8 1
execute if score #menuHidden var = #FALSE var unless score #gameState var = #IDLE var run playsound minecraft:ui.button.click master @a[x=495,y=50,z=0,distance=0..1,tag=menuRequest,tag=menuAdmin,tag=!menuTimeout] ~ ~ ~ 1 0.8 1
execute if score #menuHidden var = #TRUE var run playsound minecraft:entity.evoker.prepare_summon master @a[x=495,y=50,z=0,distance=0..1,tag=menuRequest,tag=menuAdmin,tag=!menuTimeout] ~ ~ ~ 1 2 1
execute if score #menuHidden var = #FALSE var unless score #gameState var = #IDLE var run playsound minecraft:entity.evoker.prepare_summon master @a[x=495,y=50,z=0,distance=0..1,tag=menuRequest,tag=menuAdmin,tag=!menuTimeout] ~ ~ ~ 1 2 1

tellraw @a[tag=menuRequest,tag=menuAdmin] [{"text":"[Admin Options] ","color":"white"},{"text":"Captain Selection","color":"aqua","underlined":"true","clickEvent":{"action":"run_command","value":"/function calamity:menu/captain_selection"},"hoverEvent":{"action":"show_text","value":"Select random team captains and start team selection.\nSpectators will be ignored."}},{"text":" | ","color":"white"},{"text":"Random Teams","color":"dark_aqua","underlined":"true","clickEvent":{"action":"run_command","value":"/function calamity:menu/random_teams"},"hoverEvent":{"action":"show_text","value":"Select random teams.\nSpectators will be ignored."}},{"text":" | ","color":"white"},{"text":"Reset Teams","color":"gray","underlined":"true","clickEvent":{"action":"run_command","value":"/function calamity:menu/reset_teams"},"hoverEvent":{"action":"show_text","value":"Remove players from their teams.\nSpectators will be ignored."}},{"text":" | ","color":"white"},{"text":"Force Ready","color":"green","underlined":"true","clickEvent":{"action":"run_command","value":"/function calamity:menu/force_ready"},"hoverEvent":{"action":"show_text","value":"Set all teams as ready.\nThe game will then start."}},{"text":" | ","color":"white"},{"text":"Reset Map","color":"light_purple","underlined":"true","clickEvent":{"action":"run_command","value":"/function calamity:reset"},"hoverEvent":{"action":"show_text","value":"Reset the map to play again."}},{"text":" | ","color":"white"},{"text":"Toggle Reset","color":"dark_purple","underlined":"true","clickEvent":{"action":"run_command","value":"/function calamity:menu/toggle_reset"},"hoverEvent":{"action":"show_text","value":"Toggle automatic reset at the end of a match."}},{"text":" | ","color":"white"},{"text":"Toggle Menu","color":"yellow","underlined":"true","clickEvent":{"action":"run_command","value":"/function calamity:menu/toggle_menu"},"hoverEvent":{"action":"show_text","value":"Toggle the visibility of the team options menu.\nThe admin menu is not affected."}}]
tellraw @a[tag=menuRequest,tag=menuAdmin] ""
tag @a[tag=menuRequest,tag=menuAdmin] remove menuRequest