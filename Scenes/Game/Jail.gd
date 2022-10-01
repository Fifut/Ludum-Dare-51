extends Node2D



onready var PathFollow2D = $"%PathFollow2D"



func _ready():
	Events.connect("on_clock_timeout",self, "_guardStart")
	PathFollow2D.loop = false
	
	
	
func _process(delta):
	
	PathFollow2D.offset += 500 * delta



func _guardStart():
	PathFollow2D.offset = 0
