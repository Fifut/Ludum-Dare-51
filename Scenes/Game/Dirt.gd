extends StaticBody2D


var body: KinematicBody2D


func _process(_delta):
	
	if body != null:
		
		if Input.is_action_just_pressed("grab") and body.has_method("grab"):
			var picked = body.grab(name)
			
			if picked:
				queue_free()


func _on_PickableArea_body_entered(_body):
	body = _body


func _on_PickableArea_body_exited(_body):
	body = null
