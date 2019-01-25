extends Control

func _ready():
	globals.kills = 0
	globals.currentStage = 0

func _on_QuitGameButton_pressed():
	get_tree().quit()


func _on_NewGameButton_pressed():
	get_tree().change_scene("GameScene.tscn")
