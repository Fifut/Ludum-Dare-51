tool
extends Control



onready var CanvasLayer = $"%CanvasLayer"



func _process(delta):
	
	if CanvasLayer!= null:
		CanvasLayer.visible = visible



func _on_Restart_pressed():
	get_tree().change_scene("res://Scenes/Game/GameHandler.tscn")



func _on_Quit_pressed():
	get_tree().change_scene("res://Scenes/UI/MenuHandler.tscn")
