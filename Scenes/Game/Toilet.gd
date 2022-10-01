extends StaticBody2D



onready var DropArea = $"%DropArea"
onready var Dirt = $"%Dirt"
onready var Water = $"%Water"



var body: KinematicBody2D



func _ready():
	Dirt.hide()



func _process(_delta):
	
	if body != null:
		
		if Input.is_action_just_pressed("grab") and body.has_method("drop") and not Dirt.visible:
			if body.drop():
				Dirt.show()			
			
		if Input.is_action_just_pressed("interact") and Dirt.visible:
			Water.play()
			Dirt.hide()



func _on_DropArea_body_entered(_body):
	body = _body



func _on_DropArea_body_exited(_body):
	body = null
