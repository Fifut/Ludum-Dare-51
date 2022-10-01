extends Node2D



onready var PathFollow2D = $"%PathFollow2D"



func _ready():
	Events.connect("on_clock_timeout",self, "_guardStart")
	PathFollow2D.loop = false
	
	
	
func _process(delta):
	
	PathFollow2D.offset += 500 * delta



func _guardStart():
	PathFollow2D.offset = 0


func _on_GuardFrontDoor_body_entered(body):
	print("Guard front door entered")
	Events.emit_signal("on_guard_front_door", true)


func _on_GuardFrontDoor_body_exited(body):
	print("Guard front door exited")
	Events.emit_signal("on_guard_front_door", false)
