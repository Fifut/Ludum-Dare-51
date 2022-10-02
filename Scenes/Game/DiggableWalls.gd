extends Node2D

onready var Unbreakable = preload("res://Scenes/Game/UnbreakableWall.tscn")
onready var Breakable = preload("res://Scenes/Game/BreakableWall.tscn")




func _ready():
	
	randomize()
	
#	for x in range(0, 19):
#		for y in range(0, 12):
#			if randf() > 0.75:
#				var breakable = Breakable.instance()
#				breakable.position = Vector2(120 + 60 * x, 90 + 59 * y)
#				add_child(breakable)
#
#	for _i in range(0, 10):
#		var unbreakable = Unbreakable.instance()
#		unbreakable.position = Vector2(240 + 60 * (randi() % 15), 210 + 59 * (randi() % 8) )
#		add_child(unbreakable)
#
