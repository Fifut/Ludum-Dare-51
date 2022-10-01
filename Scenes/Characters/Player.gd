extends KinematicBody2D


onready var Dirt_scene = preload("res://Scenes/Game/Dirt.tscn")


onready var AnimationPlayer = $"%AnimationPlayer"
onready var Dirt = $"%Dirt"


const ACCELERATION = 100
const DECELERATION = 300
const SPEED_MAX = Vector2(1000,1000)



var speed = Vector2.ZERO
var velocity = Vector2.ZERO
var grabbed_item = ""


func _ready():
	Dirt.hide()



func _process(delta):
	
	look_at(get_global_mouse_position() )
	_interacte()
	_direction(delta)
	
		
	
func _interacte():
	
	if grabbed_item == "" and Input.is_action_just_pressed("interact"):
		AnimationPlayer.play("Interact")


	if Input.is_action_just_pressed("grab") and grabbed_item != "":
		AnimationPlayer.play_backwards("Carry")
		var dirt = Dirt_scene.instance()
		dirt.name = grabbed_item
		dirt.position = position + Vector2(80,0).rotated(rotation)
		dirt.add_to_group("Dirt")
		get_parent().add_child(dirt)
		grabbed_item = ""


	
	

func _direction(_delta):
		
	if Input.is_action_pressed("up"):
		speed.y -= ACCELERATION

	elif Input.is_action_pressed("down"):
		speed.y += DECELERATION
		
	else:
		speed.y = 0
		
	if Input.is_action_pressed("right"):
		speed.x += ACCELERATION

	elif Input.is_action_pressed("left"):
		speed.x -= ACCELERATION
	
	else:
		speed.x = 0

#	elif speed > 0:
#		speed -= DECELERATION/2
#
#	elif speed < 0:
#		speed += DECELERATION/2
		
		
	if speed.y > SPEED_MAX.y:
		speed.y = SPEED_MAX.y
		
	elif speed.y < -SPEED_MAX.y:
		speed.y = -SPEED_MAX.y
		
	if speed.x > SPEED_MAX.x:
		speed.x = SPEED_MAX.x
		
	elif speed.x < -SPEED_MAX.x:
		speed.x = -SPEED_MAX.x
		
		
	velocity = speed
	var _err = move_and_slide(velocity)



func grab(name):
	
	if grabbed_item == "":
		print("Player grab : " + name)
		AnimationPlayer.play("Carry")
		grabbed_item = name
		return true
		
	else:
		return false


func drop():
	
	if grabbed_item != "":
		print("Player drop : " + grabbed_item)
		AnimationPlayer.play_backwards("Carry")
		grabbed_item = ""
		return true
	else:
		return false



func isCarryingSomething():
	
	if  grabbed_item == "":
		return false
	else:
		return true
