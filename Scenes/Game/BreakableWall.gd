extends Node2D



onready var InteractArea = $"%InteractArea"
onready var AnimatedSprite = $"%AnimatedSprite"
onready var CollisionShape2D = $"%CollisionShape2D"



var enable = false


func _process(delta):
	
	if enable and AnimatedSprite.frame < 4 and Input.is_action_just_pressed("interact"):
		AnimatedSprite.frame += 1
		
	elif enable and AnimatedSprite.frame >= 4 and Input.is_action_just_pressed("interact"):	
		CollisionShape2D.disabled = true
		AnimatedSprite.hide()


func _on_InteractArea_body_entered(body):
	enable = true


func _on_InteractArea_body_exited(body):
	enable = false
