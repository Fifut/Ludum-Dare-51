extends Area2D



onready var Walk = $"%Walk"


	
	
	
func start():
	Walk.play()
	
	
	
func stop():
	Walk.stop()
	
	

func _on_Guard_area_entered(_area):
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUART)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "rotation_degrees", 50.0, 0.5)



func _on_Guard_area_exited(_area):
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUART)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "rotation_degrees", 0.0, 0.5)
