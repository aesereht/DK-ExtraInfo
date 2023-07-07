extends HudElement

func _ready():
	pass

func _process(delta: float) -> void:
	($"%Res" as Label).text = "%d" % Level.map.get_node("TileData").get_resource_cells_by_id(0).size() + "/" + "%d" % Level.map.get_node("TileData").get_resource_cells_by_id(1).size() + "/" + "%d" % Level.map.get_node("TileData").get_resource_cells_by_id(2).size()
