extends Node2D



onready var PathFollow2D = $"%PathFollow2D"
onready var Shelf = $"%Shelf"



func _ready():
	var _err = Events.connect("on_clock_timeout",self, "_guardStart")
	PathFollow2D.loop = false
	
	
	
func _process(delta):
	
	PathFollow2D.offset += 500 * delta



func _guardStart():
	PathFollow2D.offset = 0



func isOkForChecking():
	return not Shelf.isOpen()


func _on_GuardFrontDoor_area_entered(area):
	print("Guard front door entered")
	Events.emit_signal("on_guard_front_door", true)


func _on_GuardFrontDoor_area_exited(area):
	print("Guard front door exited")
	Events.emit_signal("on_guard_front_door", false)
