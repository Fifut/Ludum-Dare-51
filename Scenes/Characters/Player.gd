extends KinematicBody2D


const ACCELERATION = 100
const DECELERATION = 300
const SPEED_MAX = Vector2(1000,1000)

var speed = Vector2.ZERO
var velocity = Vector2.ZERO


func _process(delta):
	
	look_at(get_global_mouse_position() )
	_direction(delta)
	

func _direction(delta):
		
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
	move_and_slide(velocity)
