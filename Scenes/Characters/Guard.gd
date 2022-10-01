extends StaticBody2D



func _ready():
	
	Events.connect("on_guard_front_door", self, "_on_guard_front_door")


func _on_guard_front_door(status):
	
	if status:
		rotation_degrees = 30
	else:
		rotation_degrees = 0
