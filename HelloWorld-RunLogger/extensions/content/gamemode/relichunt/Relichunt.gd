extends "res://content/gamemode/relichunt/Relichunt.gd"

var LoggerMod = load("res://mods-unpacked/HelloWorld-RunLogger/logger/log.gd").new()

func init() -> void:
	.init() # Call original init func GameMode 
	LoggerMod.log_run("relichunt", "GameMode")
	LoggerMod.log_run(Level.loadout.modeConfig.get(CONST.MODE_CONFIG_RELICHUNT_MAPSIZE, ""), "Relichunt")
	LoggerMod.log_run(str(Level.loadout.difficulty), "Difficulty")
	LoggerMod.log_run(str(Level.loadout.modeConfig.get(CONST.MODE_CONFIG_RELICHUNT_WORLDMODIFIERS, "")), "WorldModifiers")
	LoggerMod.log_run(Level.loadout.domeId, "DomeId")
	LoggerMod.log_run(Level.loadout.keeperId, "KeeperId")
	LoggerMod.log_run(Level.loadout.primaryGadgetId, "GadgetId")
	LoggerMod.log_run(str(Level.levelSeed), "SeedID")
