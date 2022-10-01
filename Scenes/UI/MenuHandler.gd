extends Control


onready var ButtonStart = $"%ButtonStart"


func _on_ButtonStart_pressed():
	var _err = get_tree().change_scene("res://Scenes/Game/GameHandler.tscn")
