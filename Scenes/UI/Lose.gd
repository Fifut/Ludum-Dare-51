tool
extends Control



onready var CanvasLayer = $"%CanvasLayer"



func _process(delta):
	CanvasLayer.visible = visible
