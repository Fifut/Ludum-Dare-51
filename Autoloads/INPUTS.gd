extends Node


var _grab = false


func _process(_delta):
	
	if Input.is_action_just_pressed("grab"):
		_grab = true
		
	elif Input.is_action_just_released("grab"):
		_grab = false
		
		

func is_action_just_pressed(action: String):
	
	var ret = false
	
	match action:
		
		"grab":
			ret = _grab
			_grab = false
	
	return ret
