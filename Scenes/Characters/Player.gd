extends KinematicBody2D


const ACCELERATION = 10
const DECELERATION = 10
const SPEED_MAX = 1000

var speed = 0


func _process(delta):
	
	look_at(get_global_mouse_position() )
	_direction(delta)
	

func _direction(delta):
	
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("up"):
		speed += ACCELERATION

	elif Input.is_action_pressed("down"):
		speed -= DECELERATION

	elif speed > 0:
		speed -= DECELERATION/2
		
	elif speed < 0:
		speed += DECELERATION/2
		
		
	if speed > SPEED_MAX:
		speed = SPEED_MAX
		
	elif speed < -SPEED_MAX / 2:
		speed = -SPEED_MAX / 2
		
		
	velocity = Vector2(speed, 0).rotated(rotation)
	move_and_slide(velocity)
