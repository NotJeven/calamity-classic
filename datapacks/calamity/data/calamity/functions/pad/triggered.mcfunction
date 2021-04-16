#	Description:
#		handle triggering of pads
#	Activator:
#		@e[tag=pad,tag=!padTriggered] if block ~ ~ ~ #minecraft:pressure_plates[powered=true]
#	Parents:
#		calamity:tick

execute if score @s[tag=minorPad] var < #MINORSUMMON var run scoreboard players operation #statusTime var = #MINORSUMMON var 
execute if score @s[tag=majorPad] var < #MAJORSUMMON var run scoreboard players operation #statusTime var = #MAJORSUMMON var
execute if score @s[tag=minorPad] var > #MINORSUMMON var run scoreboard players operation #statusTime var = #MINORCOOLDOWN var 
execute if score @s[tag=majorPad] var > #MAJORSUMMON var run scoreboard players operation #statusTime var = #MAJORCOOLDOWN var

execute if score @s[tag=minorPad] var > #MINORSUMMON var run scoreboard players operation #statusTime var += #20 var 
execute if score @s[tag=majorPad] var > #MAJORSUMMON var run scoreboard players operation #statusTime var += #20 var

scoreboard players operation #statusTime var -= @s[tag=minorPad] var
scoreboard players operation #statusTime var -= @s[tag=majorPad] var
scoreboard players operation #statusTime var /= #1SECOND var

execute if score @s[tag=a] var = #FALSE var positioned ~ ~ ~ if entity @p[distance=..1,team=a] run scoreboard players operation @s[tag=a] var = #TRUE var
execute if score @s[tag=a] var = #TRUE var positioned ~ ~ ~ if entity @p[distance=..1,team=a] run playsound minecraft:block.bell.use master @a[distance=..5,team=!b] ~ ~ ~ 1 2 1
execute if score @s[tag=b] var = #FALSE var positioned ~ ~ ~ if entity @p[distance=..1,team=b] run scoreboard players operation @s[tag=b] var = #TRUE var
execute if score @s[tag=b] var = #TRUE var positioned ~ ~ ~ if entity @p[distance=..1,team=b] run playsound minecraft:block.bell.use master @a[distance=..5,team=!a] ~ ~ ~ 1 2 1
execute if score @s[tag=a] var < #MINORSUMMON var positioned ~-2 ~ ~-2 run tellraw @a[dx=3,dy=1,dz=3,team=a] [{"text":"[","color":"gray"},{"selector":"@s","color":"blue"},{"text":"] ","color":"gray"},{"text":"Summoning (","color":"gray"},{"score":{"name":"#statusTime","objective":"var"},"color":"white"},{"text":"s","color":"white"},{"text":")","color":"gray"}]
execute if score @s[tag=b] var < #MINORSUMMON var positioned ~-2 ~ ~-2 run tellraw @a[dx=3,dy=1,dz=3,team=b] [{"text":"[","color":"gray"},{"selector":"@s","color":"yellow"},{"text":"] ","color":"gray"},{"text":"Summoning (","color":"gray"},{"score":{"name":"#statusTime","objective":"var"},"color":"white"},{"text":"s","color":"white"},{"text":")","color":"gray"}]
execute if score @s[tag=a] var > #MINORSUMMON var positioned ~-2 ~ ~-2 run tellraw @a[dx=3,dy=1,dz=3,team=a] [{"text":"[","color":"gray"},{"selector":"@s","color":"blue"},{"text":"] ","color":"gray"},{"text":"Cooldown (","color":"gray"},{"score":{"name":"#statusTime","objective":"var"},"color":"white"},{"text":"s","color":"white"},{"text":")","color":"gray"}]
execute if score @s[tag=b] var > #MINORSUMMON var positioned ~-2 ~ ~-2 run tellraw @a[dx=3,dy=1,dz=3,team=b] [{"text":"[","color":"gray"},{"selector":"@s","color":"yellow"},{"text":"] ","color":"gray"},{"text":"Cooldown (","color":"gray"},{"score":{"name":"#statusTime","objective":"var"},"color":"white"},{"text":"s","color":"white"},{"text":")","color":"gray"}]

execute if score @s[tag=majorPad] var = #FALSE var run scoreboard players operation @s[tag=majorPad] var = #TRUE var
execute if score @s[tag=majorPad] var = #TRUE var run playsound minecraft:block.bell.use master @a ~ ~ ~ 1.25 1.2 0
execute if score @s[tag=majorPad] var < #MAJORSUMMON var positioned ~-3 ~ ~-4 run tellraw @a[dx=5,dy=1,dz=7] [{"text":"[","color":"gray"},{"selector":"@s","color":"white"},{"text":"] ","color":"gray"},{"text":"Summoning (","color":"gray"},{"score":{"name":"#statusTime","objective":"var"},"color":"white"},{"text":"s","color":"white"},{"text":")","color":"gray"}]
execute if score @s[tag=majorPad] var > #MAJORSUMMON var positioned ~-3 ~ ~-4 run tellraw @a[dx=5,dy=1,dz=7] [{"text":"[","color":"gray"},{"selector":"@s","color":"white"},{"text":"] ","color":"gray"},{"text":"Cooldown (","color":"gray"},{"score":{"name":"#statusTime","objective":"var"},"color":"white"},{"text":"s","color":"white"},{"text":")","color":"gray"}]

tag @s[tag=!padTriggered] add padTriggered