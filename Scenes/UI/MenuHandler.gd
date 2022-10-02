extends Control


onready var ButtonStart = $"%ButtonStart"
onready var ButtonQuit = $"%ButtonQuit"
onready var Camera0 = $"%Camera2D"
onready var Main = $"%Main"
onready var HowTo = $"%HowTo"



func _ready():
	Camera0.position = Main.rect_position + Main.rect_pivot_offset
	


func _on_ButtonStart_pressed():
	var _err = get_tree().change_scene("res://Scenes/Game/GameHandler.tscn")



func _on_ButtonHowTo_pressed():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUART)
	tween.set_ease(Tween.EASE_OUT)
	
	tween.tween_property(Camera0, "position", HowTo.rect_position + HowTo.rect_pivot_offset, 2.0)
	tween.parallel().tween_property(Camera0, "rotation_degrees", HowTo.rect_rotation, 2.0)



func _on_ButtonQuit_pressed():
	get_tree().quit()



func _on_ButtonBack_pressed():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUART)
	tween.set_ease(Tween.EASE_OUT)
	
	tween.tween_property(Camera0, "position", Main.rect_position + Main.rect_pivot_offset, 2.0)
	tween.parallel().tween_property(Camera0, "rotation_degrees", Main.rect_rotation, 2.0)
