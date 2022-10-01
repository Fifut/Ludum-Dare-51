extends Node2D


signal on_EscapeArea_body_entered


func _on_EscapeArea_body_entered(_body):
	emit_signal("on_EscapeArea_body_entered")
