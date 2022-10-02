extends Node2D



onready var PathFollow2D = $"%PathFollow2D"
onready var Path_2D = $"%Path2D"
onready var Shelf = $"%Shelf"
onready var Guard = $"%Guard"
onready var JailArea = $"%JailArea"



func _ready():
	
	var _err = Events.connect("on_clock_timeout",self, "_guardStart")
	
	PathFollow2D.loop = false
	print(Path_2D.curve.get_baked_length())
	
	
func _process(delta):
	PathFollow2D.offset += 00 * delta



func _guardStart():
	PathFollow2D.offset = 0


func stop():
	Guard.stop()
	set_process(false)


func isOkForChecking():
	
	for area in JailArea.get_overlapping_areas() :
		if area.is_in_group("Dirt"):
			return false
			
	for body in JailArea.get_overlapping_bodies():
		if body is KinematicBody2D:
			return not Shelf.isOpen()

	return false



func _on_GuardFrontDoor_area_entered(_area):
	print("Guard front door entered")
	Events.emit_signal("on_guard_front_door", true)


func _on_GuardFrontDoor_area_exited(_area):
	print("Guard front door exited")
	Events.emit_signal("on_guard_front_door", false)
