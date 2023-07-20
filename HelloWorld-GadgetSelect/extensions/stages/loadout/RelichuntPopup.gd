extends "res://stages/loadout/RelichuntPopup.gd"

func _ready():
	var node = OptionButton.new()
	node.align = Button.ALIGN_CENTER
	$PanelContainer/MarginContainer/VBoxContainer/HBoxContainer5/VBoxContainer.add_child(node)
	$PanelContainer/MarginContainer/VBoxContainer/HBoxContainer5/VBoxContainer.move_child(node,0)
	Style.init(self)
	
func init():
	.init()
	var GadgetButton = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer5/VBoxContainer.get_child(0)
	GadgetButton.clear()
	GadgetButton.add_item("Select starting Gadget (none)")
	for i in GameWorld.availableGadgets():
		GadgetButton.add_item(i)
	
func onClose():
	.onClose()
	var GadgetButton = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer5/VBoxContainer.get_child(0)
	if GadgetButton.get_selected_id() > 0:
		GameWorld.keptGadgetUsed = false
		GameWorld.gadgetToKeep = GadgetButton.get_item_text(GadgetButton.get_selected_id())
	else:
		GameWorld.gadgetToKeep = ""

