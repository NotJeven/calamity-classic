#	Description:
#		summons and manages the in minecraft world objects of the pads
#	Activator:
#		none
#	Parents:
#		

kill @e[type=area_effect_cloud,tag=pad]

# blue resource
summon area_effect_cloud 169 42 118 {Duration:2147483647,CustomName:"\"Wood\"",Tags:["pad","woodPad","pad1","minorPad","itemPad","leftLane","a"],Rotation:[90.0f,0.0f]}
summon area_effect_cloud 164 43 142 {Duration:2147483647,CustomName:"\"Cobble\"",Tags:["pad","cobblePad","pad2","minorPad","itemPad","leftLane","a"],Rotation:[90.0f,0.0f]}
summon area_effect_cloud 150 40 136 {Duration:2147483647,CustomName:"\"Chain\"",Tags:["pad","chainPad","pad3","minorPad","itemPad","leftLane","a"],Rotation:[90.0f,0.0f]}
summon area_effect_cloud 151 56 154 {Duration:2147483647,CustomName:"\"Arrow\"",Tags:["pad","arrowPad","pad4","minorPad","itemPad","leftLane","a"],Rotation:[90.0f,0.0f]}
summon area_effect_cloud 157 55 173 {Duration:2147483647,CustomName:"\"TNT\"",Tags:["pad","tntPad","pad5","minorPad","itemPad","leftLane","a"],Rotation:[90.0f,0.0f]}

# red effect
summon area_effect_cloud 170 41 162 {Duration:2147483647,CustomName:"\"Resistance\"",Tags:["pad","resistancePad","pad6","minorPad","effectPad","leftLane","b"],Rotation:[90.0f,0.0f]}
summon area_effect_cloud 150 32 162 {Duration:2147483647,CustomName:"\"Strength\"",Tags:["pad","strengthPad","pad7","minorPad","effectPad","leftLane","b"],Rotation:[90.0f,0.0f]}
summon area_effect_cloud 157 18 189 {Duration:2147483647,CustomName:"\"Speed\"",Tags:["pad","speedPad","pad8","minorPad","effectPad","leftLane","b"],Rotation:[90.0f,0.0f]}
summon area_effect_cloud 157 50 189 {Duration:2147483647,CustomName:"\"Regen\"",Tags:["pad","regenPad","pad9","minorPad","effectPad","leftLane","b"],Rotation:[90.0f,0.0f]}

# red resource
summon area_effect_cloud 103 42 118 {Duration:2147483647,CustomName:"\"Wood\"",Tags:["pad","woodPad","pad1","minorPad","itemPad","rightLane","b"],Rotation:[-90.0f,0.0f]}
summon area_effect_cloud 108 43 142 {Duration:2147483647,CustomName:"\"Cobble\"",Tags:["pad","cobblePad","pad2","minorPad","itemPad","rightLane","b"],Rotation:[-90.0f,0.0f]}
summon area_effect_cloud 122 40 136 {Duration:2147483647,CustomName:"\"Chain\"",Tags:["pad","chainPad","pad3","minorPad","itemPad","rightLane","b"],Rotation:[-90.0f,0.0f]}
summon area_effect_cloud 121 56 154 {Duration:2147483647,CustomName:"\"Arrow\"",Tags:["pad","arrowPad","pad4","minorPad","itemPad","rightLane","b"],Rotation:[-90.0f,0.0f]}
summon area_effect_cloud 115 55 173 {Duration:2147483647,CustomName:"\"TNT\"",Tags:["pad","tntPad","pad5","minorPad","itemPad","rightLane","b"],Rotation:[-90.0f,0.0f]}

# blue effect
summon area_effect_cloud 102 41 162 {Duration:2147483647,CustomName:"\"Resistance\"",Tags:["pad","resistancePad","pad6","minorPad","effectPad","rightLane","a"],Rotation:[-90.0f,0.0f]}
summon area_effect_cloud 122 32 162 {Duration:2147483647,CustomName:"\"Strength\"",Tags:["pad","strengthPad","pad7","minorPad","effectPad","rightLane","a"],Rotation:[-90.0f,0.0f]}
summon area_effect_cloud 115 18 189 {Duration:2147483647,CustomName:"\"Speed\"",Tags:["pad","speedPad","pad8","minorPad","effectPad","rightLane","a"],Rotation:[-90.0f,0.0f]}
summon area_effect_cloud 115 50 189 {Duration:2147483647,CustomName:"\"Regen\"",Tags:["pad","regenPad","pad9","minorPad","effectPad","rightLane","a"],Rotation:[-90.0f,0.0f]}

# majors
summon area_effect_cloud 136 55 188 {Duration:2147483647,CustomName:"\"Enchantment\"",Tags:["pad","enchantPad","pad13","majorPad"],Rotation:[180.0f,0.0f]}
summon area_effect_cloud 136 23 188 {Duration:2147483647,CustomName:"\"Iron\"",Tags:["pad","ironPad","pad14","majorPad"],Rotation:[180.0f,0.0f]}

# objectives
summon area_effect_cloud 159 43 100 {Duration:2147483647,CustomName:"\"Bastion\"",Tags:["pad","pad15","objectivePad"]}
summon area_effect_cloud 113 43 100 {Duration:2147483647,CustomName:"\"Bastion\"",Tags:["pad","pad16","objectivePad"]}

# enchantmets Left
summon area_effect_cloud 152 32 96 {Duration:2147483647,CustomName:"\"Infinity\"",Tags:["pad","enchPad","enchInfinity"]}
summon area_effect_cloud 152 32 92 {Duration:2147483647,CustomName:"\"Punch\"",Tags:["pad","enchPad","enchPunch"]}
summon area_effect_cloud 157 32 87 {Duration:2147483647,CustomName:"\"Power\"",Tags:["pad","enchPad","enchPower"]}
summon area_effect_cloud 161 32 87 {Duration:2147483647,CustomName:"\"Sharpness\"",Tags:["pad","enchPad","enchSharp"]}
summon area_effect_cloud 166 32 92 {Duration:2147483647,CustomName:"\"Knockback\"",Tags:["pad","enchPad","enchKnock"]}
summon area_effect_cloud 166 32 96 {Duration:2147483647,CustomName:"\"Protection\"",Tags:["pad","enchPad","enchProt"]}

# enchantments Right
summon area_effect_cloud 120 32 96 {Duration:2147483647,CustomName:"\"Infinity\"",Tags:["pad","enchPad","enchInfinity"]}
summon area_effect_cloud 120 32 92 {Duration:2147483647,CustomName:"\"Punch\"",Tags:["pad","enchPad","enchPunch"]}
summon area_effect_cloud 115 32 87 {Duration:2147483647,CustomName:"\"Power\"",Tags:["pad","enchPad","enchPower"]}
summon area_effect_cloud 111 32 87 {Duration:2147483647,CustomName:"\"Sharpness\"",Tags:["pad","enchPad","enchSharp"]}
summon area_effect_cloud 106 32 92 {Duration:2147483647,CustomName:"\"Knockback\"",Tags:["pad","enchPad","enchKnock"]}
summon area_effect_cloud 106 32 96 {Duration:2147483647,CustomName:"\"Protection\"",Tags:["pad","enchPad","enchProt"]}

# teleporters left
summon area_effect_cloud 167 51 94 {Duration:2147483647,CustomName:"\"Mid\"",Tags:["pad","teleportPad","teleEnd","a"]}
summon area_effect_cloud 167 51 93 {Duration:2147483647,CustomName:"\"Exit\"",Tags:["pad","teleportPad","teleExit","a"],Rotation:[180.0f,0.0f]}

summon area_effect_cloud 167 42 108 {Duration:2147483647,CustomName:"\"Top\"",Tags:["pad","teleportPad","teleMid","a"]}
summon area_effect_cloud 167 42 109 {Duration:2147483647,CustomName:"\"Exit\"",Tags:["pad","teleportPad","teleMidExit","a"]}

summon area_effect_cloud 151 42 108 {Duration:2147483647,CustomName:"\"Bot\"",Tags:["pad","teleportPad","teleMid","a"]}
summon area_effect_cloud 151 42 109 {Duration:2147483647,CustomName:"\"Exit\"",Tags:["pad","teleportPad","teleMidExit","a"]}

summon area_effect_cloud 151 32 108 {Duration:2147483647,CustomName:"\"Mid\"",Tags:["pad","teleportPad","teleEnd","a"]}
summon area_effect_cloud 151 32 107 {Duration:2147483647,CustomName:"\"Exit\"",Tags:["pad","teleportPad","teleExit","a"],Rotation:[180.0f,0.0f]}

# teleport right
summon area_effect_cloud 105 51 94 {Duration:2147483647,CustomName:"\"Mid\"",Tags:["pad","teleportPad","teleEnd","b"]}
summon area_effect_cloud 105 51 93 {Duration:2147483647,CustomName:"\"Exit\"",Tags:["pad","teleportPad","teleExit","b"],Rotation:[180.0f,0.0f]}

summon area_effect_cloud 105 42 108 {Duration:2147483647,CustomName:"\"Top\"",Tags:["pad","teleportPad","teleMid","b"]}
summon area_effect_cloud 105 42 109 {Duration:2147483647,CustomName:"\"Exit\"",Tags:["pad","teleportPad","teleMidExit","b"]}

summon area_effect_cloud 121 42 108 {Duration:2147483647,CustomName:"\"Bot\"",Tags:["pad","teleportPad","teleMid","b"]}
summon area_effect_cloud 121 42 109 {Duration:2147483647,CustomName:"\"Exit\"",Tags:["pad","teleportPad","teleMidExit","b"]}

summon area_effect_cloud 121 32 108 {Duration:2147483647,CustomName:"\"Mid\"",Tags:["pad","teleportPad","teleEnd","b"]}
summon area_effect_cloud 121 32 107 {Duration:2147483647,CustomName:"\"Exit\"",Tags:["pad","teleportPad","teleExit","b"],Rotation:[180.0f,0.0f]}


scoreboard players set @e[tag=pad] var 0