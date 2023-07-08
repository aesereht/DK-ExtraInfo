extends "res://stages/title/TitleStage.gd"


func beforeStart():
	.beforeStart()
	find_node("VersionLabel").text = "- Enable Log - " + GameWorld.getVersionPrint()

func _ready():
	var node = Button.new()
	node.text = "Leaderboard"
	$Canvas/MainMenu/Panel/MainMenuButtons.add_child(node)
	$Canvas/MainMenu/Panel/MainMenuButtons.move_child(node,0)
	node.connect("pressed", self, "_add_a_scene_manually")
	#Style.init(self)
	
	

#func _add_a_scene_manually()->void :
#	Audio.sound("gui_title_newgame")
#	StageManager.startStage("tool/Leaderboard/LeaderboardCheatViewer")
#	#find_node("Leaderboard").disabled = true
	
func _add_a_scene_manually():
	Audio.sound("gui_title_newgame")
	var GrabedInstance= load("res://tool/Leaderboard/LeaderboardCheatViewer.tscn").instance()
	GrabedInstance.name = "Lead"
	self.add_child(GrabedInstance)
	$Canvas.queue_free()

