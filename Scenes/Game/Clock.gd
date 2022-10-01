extends Node2D


onready var TenSecondsTimer = $"%TenSecondsTimer"
onready var ClockHandSprite = $"%ClockHandSprite"


func _process(delta):
	
	ClockHandSprite.rotation_degrees = range_lerp(TenSecondsTimer.time_left, 10, 0, 0, 360)
