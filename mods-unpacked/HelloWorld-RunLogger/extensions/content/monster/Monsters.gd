extends "res://content/monster/Monsters.gd"

var LoggerMod = load("res://mods-unpacked/HelloWorld-RunLogger/logger/log.gd").new()
var tempArray = []

func spawnWave():
	.spawnWave()
	tempArray = []
	for index in range(0, currentWave.entries.size()/2):
		tempArray.append(currentWave.entries[index*2])
	LoggerMod.log_run(String(tempArray) , "WavePlan")
	LoggerMod.log_run(String(GameWorld.boughtUpgrades), "Upgrades")
	LoggerMod.log_run("%d" % Level.map.get_node("TileData").get_resource_cells_by_id(0).size(), "IronOre")
	LoggerMod.log_run("%d" % Level.map.get_node("TileData").get_resource_cells_by_id(1).size(), "WaterOre")
	LoggerMod.log_run("%d" % Level.map.get_node("TileData").get_resource_cells_by_id(2).size(), "CobaltOre")
	LoggerMod.log_run(String(GameWorld.runTime), "RunTime")
	LoggerMod.log_run(String(Data.of("monsters.cycle")), "Wave")
	LoggerMod.log_run(String(Level.mode.getRunWeight()), "RunWeight")
	LoggerMod.log_run(String(Data.of("inventory.totaliron")), "TotalInvIron")
	LoggerMod.log_run(String(Data.of("inventory.totalwater")), "TotalInvWater")
	LoggerMod.log_run(String(Data.of("inventory.totalsand")), "TotalInvSand")


func finishWave():
	.finishWave()
	LoggerMod.log_run(String(GameWorld.boughtUpgrades), "Upgrades")
	LoggerMod.log_run(String(GameWorld.runTime), "RunTime")
	LoggerMod.log_run(String(Level.monsters.waveDamageCounter), "Damage Counter")
	LoggerMod.log_run(String(GameWorld.runStats.get("tiles_destroyed", 0)), "Tiles Destroyed")
	LoggerMod.log_run(str(Data.of("prestige.baseperwave")), "IronMuli")
	LoggerMod.log_run(str(Data.of("prestige.multiplier")), "CobaltMuli")
	
