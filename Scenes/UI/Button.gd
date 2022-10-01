tool
extends TextureButton



export(String) var Text = "Button"


signal on_Button_pressed



onready var AnimationPlayer = $"%AnimationPlayer"
onready var Label = $"%Label"



func _process(_delta):
	
	if Text.length() > 1:
		Label.text = Text
	else:
		Label.text = "Button"



func _on_Button_mouse_entered():
	AnimationPlayer.play("Mouse_entered")



func _on_Button_mouse_exited():
	AnimationPlayer.play_backwards("Mouse_entered")



func _on_Button_pressed():
	emit_signal("on_Button_pressed")
