tool
extends Control


onready var AnimationPlayer = $"%AnimationPlayer"
onready var CanvasLayer = $"%CanvasLayer"


func _process(delta):
	CanvasLayer.visible = visible


func _ready():
	AnimationPlayer.play("Fade")
