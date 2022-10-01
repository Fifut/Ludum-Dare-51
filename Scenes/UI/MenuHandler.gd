extends Control


onready var ButtonStart = $"%ButtonStart"


func _on_ButtonStart_pressed():
	get_tree().change_scene("res://Scenes/Game/Outside.tscn")
