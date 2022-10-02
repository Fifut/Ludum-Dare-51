extends Area2D


onready var Walk = $"%Walk"
onready var Bubble = $"%Bubble"
onready var Label = $"%Label"

func _ready():
	Bubble.hide()

	
func start():
	Walk.play()
	
	
func stop():
	Walk.stop()
	

func _on_Guard_area_entered(_area):

	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUART)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "rotation_degrees", 50.0, 0.5)
	
	yield(get_tree().create_timer(0.3), "timeout")
	
	match randi()% 5:
		1: Label.text = "Time to sleep"
		2: Label.text = "Shut up!"
		3: Label.text = "You're my little"
		4: Label.text = "Y'll never get out"
			
	Bubble.show()
	



func _on_Guard_area_exited(_area):
	
	Bubble.hide()
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUART)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "rotation_degrees", 0.0, 0.5)
