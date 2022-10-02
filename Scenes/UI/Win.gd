tool
extends Control



onready var CanvasLayer = $"%CanvasLayer"
onready var Value = $"%Value"
onready var AnimationPlayer = $"%AnimationPlayer"
onready var Restart = $"%Restart"
onready var Quit = $"%Quit"
onready var Timer = $"%Timer"



func _ready():
	_initialization()



func _process(_delta):
	
	if CanvasLayer!= null:
		CanvasLayer.visible = visible



func _initialization():

		Restart.hide()
		Quit.hide()
		Restart.modulate.a = 0
		Quit.modulate.a = 0



func setScore(value):
	Value.text = str(value)



func _on_Restart_pressed():
	var _err = get_tree().change_scene("res://Scenes/Game/GameHandler.tscn")



func _on_Quit_pressed():
	var _err = get_tree().change_scene("res://Scenes/UI/MenuHandler.tscn")



func _on_Timer_timeout():
	Restart.show()
	Quit.show()
	AnimationPlayer.play("Buttons")


func _on_Win_visibility_changed():
	_initialization()
	Timer.start()
