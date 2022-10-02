extends Control


onready var AnimationPlayer = $"%AnimationPlayer"


func _ready():
	AnimationPlayer.play("Fade")
