extends "res://content/gamemode/relichunt/Relichunt.gd"

func init() -> void:
	.init() # Call original init func
	Level.hud.addHudElement({"hud": "mods-unpacked/HelloWorld-ExtraInfo/hud/TrackRes.tscn" })

func _process(delta):
	if Level.map.getTileCoord(Level.keeper.global_position).y < -2:
		Level.hud.removeHudElement({"hud": "mods-unpacked/HelloWorld-ExtraInfo/hud/TrackRes.tscn" })
	else:
		Level.hud.addHudElement({"hud": "mods-unpacked/HelloWorld-ExtraInfo/hud/TrackRes.tscn" })
