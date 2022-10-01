extends StaticBody2D



onready var IntercatArea = $"%IntercatArea"
onready var Open = $"%Open"
onready var Close = $"%Close"



var main_position = Vector2.ZERO
var enable = false

var open = false



func _ready():
	main_position = global_position



func _process(_delta):
	
	if enable and Input.is_action_just_pressed("interact"):
		_move()



func _move():
	
	if open:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_QUART)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "global_position", main_position, 1.0)
		
		Open.play()
		open = false
	else:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_QUART)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "global_position", main_position + Vector2(350, 0), 1.0)
		
		Close.play()
		open = true



func _on_IntercatArea_body_entered(_body):
	enable = true



func _on_IntercatArea_body_exited(_body):
	enable = false



func isOpen():
	return open
