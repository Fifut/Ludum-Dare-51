tool
extends TextureButton



export(String) var Text = "Button"



onready var AnimationPlayer = $"%AnimationPlayer"
onready var Label = $"%Label"



func _ready():
	AnimationPlayer.play("RESET")



func _process(_delta):
	
	if Label != null and Text.length() > 1:
		Label.text = Text
	elif Label != null:
		Label.text = "Button"



func _on_Button_mouse_entered():
	AnimationPlayer.play("Mouse_entered")



func _on_Button_mouse_exited():
	AnimationPlayer.play_backwards("Mouse_entered")

