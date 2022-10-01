extends PathFollow2D


onready var Guard = $"%Guard"



func _process(delta):
	
	if unit_offset <= 0.05:
		Guard.start()
	
	elif unit_offset > 0.9:
		Guard.stop()
