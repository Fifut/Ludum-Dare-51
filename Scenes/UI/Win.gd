tool
extends Control



onready var CanvasLayer = $"%CanvasLayer"



func _process(_delta):
	
	if CanvasLayer!= null:
		CanvasLayer.visible = visible



func _on_Restart_pressed():
	var _err = get_tree().change_scene("res://Scenes/Game/GameHandler.tscn")



func _on_Quit_pressed():
	var _err = get_tree().change_scene("res://Scenes/UI/MenuHandler.tscn")
