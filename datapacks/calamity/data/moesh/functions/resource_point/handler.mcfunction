# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Handler for for full resource point machine
#---------------------------------------------------------------------------------------------------

# If a point is running, tick it down and set it to Output if finished
scoreboard players remove @e[type=area_effect_cloud,name=ResourcePoint,tag=Charging,scores={PointTimer=1..}] PointTimer 1
tag @e[type=area_effect_cloud,name=ResourcePoint,tag=Charging,scores={PointTimer=0}] add Output

# If a point is resetting tick it down and set it to ReadyToStart if finished
scoreboard players remove @e[type=area_effect_cloud,name=ResourcePoint,tag=Resetting,scores={PointTimer=1..}] PointTimer 1
tag @e[type=area_effect_cloud,name=ResourcePoint,tag=Resetting,scores={PointTimer=0}] add ReadyToStart

# Check if a player is standing on the custom "pressure plate" every tick.
function moesh:resource_point/pressure_plate/trigger

# If running, update lights and play a sound
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=Charging] at @s run function moesh:resource_point/update_lights_progress
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=Charging] at @s run function moesh:resource_point/update_lights_charging 
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=Charging] at @s run function moesh:resource_point/playsound_every_second 
# If resetting, update lights only
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=Resetting] at @s run function moesh:resource_point/update_lights_progress
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=Resetting] at @s run function moesh:resource_point/update_lights_resetting

# Always update the sign
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=Charging] at @s run function moesh:resource_point/update_sign
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=Resetting] at @s run function moesh:resource_point/update_sign

# Only output or reset AFTER updating lights/sign
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=Output] at @s run function moesh:resource_point/output
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] at @s run function moesh:resource_point/reset