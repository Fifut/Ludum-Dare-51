extends Control


onready var TenSecondsTimer = $"%TenSecondsTimer"
onready var ClockHandSprite = $"%ClockHandSprite"


func _process(_delta):
	ClockHandSprite.rotation_degrees = range_lerp(TenSecondsTimer.time_left, 10, 0, 0, 360)


func _on_TenSecondsTimer_timeout():
	Events.emit_signal("on_clock_timeout")
