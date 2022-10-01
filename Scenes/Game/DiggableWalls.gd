extends Node2D

onready var Unbreakable = preload("res://Scenes/Game/UnbreakableWall.tscn")
onready var Breakable = preload("res://Scenes/Game/BreakableWall.tscn")




func _ready():
	
	randomize()
	
	for x in range(0, 19):
		for y in range(0, 12):
			var breakable = Breakable.instance()
			breakable.position = Vector2(120 + 60 * x, 60 + 60 * y)
			add_child(breakable)
		
	for _i in range(0, 10):
		var unbreakable = Unbreakable.instance()
		unbreakable.position = Vector2(120 + 60 * (randi() % 19), 60 + 60 * (randi() % 12) )
		add_child(unbreakable)
		
