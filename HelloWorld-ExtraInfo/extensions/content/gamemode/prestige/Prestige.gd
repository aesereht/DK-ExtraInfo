extends "res://content/gamemode/prestige/Prestige.gd"


func _process(delta):
	if Level.map.getTileCoord(Level.keeper.global_position).y < -2:
		Level.hud.removeHudElement({"hud": "mods-unpacked/HelloWorld-ExtraInfo/hud/TrackRes.tscn" })
	else:
		Level.hud.addHudElement({"hud": "mods-unpacked/HelloWorld-ExtraInfo/hud/TrackRes.tscn" })
		ModLoaderUtils.log_info("Init", "MOD_LOG") #< added just for testing
