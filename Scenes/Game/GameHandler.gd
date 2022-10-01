extends Node2D



onready var Jail = $"%Jail"
onready var Player = $"%Player"


func _ready():
	
	Events.connect("on_guard_front_door", self, "jailChecking")



func jailChecking(status):
	print("Jail checking : " + str(status) )
	


func _on_Outside_on_EscapeArea_body_entered():
	pass # TODO c'est la fin du jeu, niveau suivant



func isCheckingOk():
	return Jail.isOkForChecking() and not Player.isCarryingSomething()
