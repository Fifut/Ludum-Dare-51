extends StaticBody2D



onready var IntercatArea = $"%IntercatArea"


var main_position = Vector2.ZERO
var enable = false
var open = false



func _ready():
	main_position = global_position



func _process(delta):
	
	if enable and Input.is_action_just_pressed("interact"):
		move()



func move():
	
	if open:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_QUART)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "global_position", main_position, 1.0)
		open = false
	else:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_QUART)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "global_position", main_position + Vector2(300, 0), 1.0)
		open = true



func _on_IntercatArea_body_entered(body):
	enable = true



func _on_IntercatArea_body_exited(body):
	enable = false
