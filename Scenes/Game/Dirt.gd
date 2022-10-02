extends StaticBody2D


onready var Pickup = $"%Pickup"
onready var Drop = $"%Drop"


var body


func _ready():
	Drop.play()


func _process(_delta):
	
	if body != null:
		
		if body.has_method("grab"):
			if Inputs.is_action_just_pressed("grab") :
				var picked = body.grab(name)
				
				if picked:
					playPickup()
					hide()
					yield(Pickup, "finished")
					queue_free()


func playPickup():
	Pickup.play()


func playDrop():
	Drop.play()


func _on_PickableArea_body_entered(_body):
	body = _body


func _on_PickableArea_body_exited(_body):
	body = null

