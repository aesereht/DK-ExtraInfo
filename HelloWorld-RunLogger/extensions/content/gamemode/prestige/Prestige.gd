extends "res://content/gamemode/prestige/Prestige.gd"

var LoggerMod = load("res://mods-unpacked/HelloWorld-RunLogger/logger/log.gd").new()

func init() -> void:
	.init() # Call original init func
	LoggerMod.log_run(Level.loadout.modeConfig.get(CONST.MODE_CONFIG_PRESTIGE_VARIANT, ""), "GameMode")
	LoggerMod.log_run(String(Level.loadout.modeConfig.get(CONST.MODE_CONFIG_PRESTIGE_FRIENDLY_MODE, "")), "FriendlyMode")
	LoggerMod.log_run(Level.loadout.domeId, "DomeId")
	LoggerMod.log_run(Level.loadout.keeperId, "KeeperId")
	LoggerMod.log_run(Level.loadout.primaryGadgetId, "GadgetId")
	LoggerMod.log_run(str(Level.levelSeed), "SeedID")
