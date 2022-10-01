extends Node2D


onready var Dirt = preload("res://Scenes/Game/Dirt.tscn")

onready var InteractArea = $"%InteractArea"
onready var AnimatedSprite = $"%AnimatedSprite"
onready var CollisionShape2D = $"%CollisionShape2D"
onready var Hurt01 = $"%Hurt01"
onready var Hurt02 = $"%Hurt02"
onready var Hurt03 = $"%Hurt03"
onready var Hurt04 = $"%Hurt04"



var enable = false


func _process(_delta):
	
	if enable and AnimatedSprite.frame < 3 and Input.is_action_just_pressed("interact"):
		AnimatedSprite.frame += 1
		
		match AnimatedSprite.frame:
			1: Hurt01.play()
			2: Hurt02.play()
			3: Hurt03.play()
		
	elif enable and AnimatedSprite.frame >= 3 and Input.is_action_just_pressed("interact"):	
		
		Hurt04.play()

		var dirt = Dirt.instance()
		dirt.position = position
		get_parent().add_child(dirt)
		queue_free()


func _on_InteractArea_body_entered(_body):
	enable = true


func _on_InteractArea_body_exited(_body):
	enable = false
