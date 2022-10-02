tool
extends Control



onready var CanvasLayer = $"%CanvasLayer"
onready var Value = $"%Value"


func _process(_delta):
	
	if CanvasLayer!= null:
		CanvasLayer.visible = visible



func setScore(value):
	Value.text = str(value)



func _on_Restart_pressed():
	var _err = get_tree().change_scene("res://Scenes/Game/GameHandler.tscn")



func _on_Quit_pressed():
	var _err = get_tree().change_scene("res://Scenes/UI/MenuHandler.tscn")
