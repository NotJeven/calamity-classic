#	Description:
#		Makes the names of the pad objectives visible
#	Activator:
#		none
#	Parents:
#		self

execute as @e[tag=pad] at @s run data merge entity @s {CustomNameVisible:1}