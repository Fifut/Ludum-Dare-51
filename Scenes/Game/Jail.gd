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
	Events.emit_signal("on_guard_front_door", true)


func _on_GuardFrontDoor_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	Events.emit_signal("on_guard_front_door", false)
