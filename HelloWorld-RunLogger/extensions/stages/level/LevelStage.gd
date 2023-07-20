extends "res://stages/level/LevelStage.gd"

var LoggerMod = load("res://mods-unpacked/HelloWorld-RunLogger/logger/log.gd").new()

func showEndingPanel(popup):
	.showEndingPanel(popup)
	
	LoggerMod.log_run(String(1 if GameWorld.won else 0), "WinCond")
	LoggerMod.log_run(String(Recorder.tileEvents), "TileHistory")

func openPauseMenu():
	.openPauseMenu()
	var seedbutton = Button.new()
	seedbutton.text = "Leaderboard"

#/root/StageManager/CurrentStage/LevelStage/PauseMenu/MenuPanel/VBoxContainer
