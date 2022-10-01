extends Node2D


onready var Dirt = preload("res://Scenes/Game/Dirt.tscn")

onready var InteractArea = $"%InteractArea"
onready var AnimatedSprite = $"%AnimatedSprite"
onready var CollisionShape2D = $"%CollisionShape2D"



var enable = false


func _process(_delta):
	
	if enable and AnimatedSprite.frame < 3 and Input.is_action_just_pressed("interact"):
		AnimatedSprite.frame += 1
		
	elif enable and AnimatedSprite.frame >= 3 and Input.is_action_just_pressed("interact"):	
		var dirt = Dirt.instance()
		dirt.position = position
		get_parent().add_child(dirt)
		queue_free()


func _on_InteractArea_body_entered(_body):
	enable = true


func _on_InteractArea_body_exited(_body):
	enable = false
