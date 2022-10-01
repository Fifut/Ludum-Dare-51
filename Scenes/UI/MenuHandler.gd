extends Control


onready var ButtonStart = $"%ButtonStart"
onready var ButtonQuit = $"%ButtonQuit"



func _on_ButtonStart_pressed():
	var _err = get_tree().change_scene("res://Scenes/Game/GameHandler.tscn")




func _on_ButtonQuit_pressed():
	get_tree().quit()
