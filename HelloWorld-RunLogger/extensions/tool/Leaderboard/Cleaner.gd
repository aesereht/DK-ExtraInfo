extends "res://tool/Leaderboard/Cleaner.gd"

func _ready():
	$MarginContainer/PanelContainer/VBoxContainer/HBoxContainer/ButtonPrestige5.visible = false
	var node = Button.new()
	node.text = "friendly"
	$MarginContainer/PanelContainer/VBoxContainer/HBoxContainer.add_child(node)
	$MarginContainer/PanelContainer/VBoxContainer/HBoxContainer.move_child(node,6)
	node.connect("pressed", self, "_on_ButtonPrestige6_pressed")
	
	var node2 = Button.new()
	node2.text = "Go Back"
	$MarginContainer/PanelContainer/VBoxContainer/HBoxContainer.add_child(node2)
	node2.connect("pressed", self, "_on_Exit_pressed")
	
	Style.init(self)


func _on_ButtonPrestige6_pressed():
	leaderboardSuffix = "_friendly"
	_on_ButtonUpdate_pressed()

func _on_Exit_pressed():
	StageManager.startStage("stages/title/title")
	#get_tree().quit()
