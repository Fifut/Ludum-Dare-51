extends Node2D



onready var Jail = $"%Jail"
onready var Player = $"%Player"
onready var Lose = $"%Lose" 
onready var Music = $"%Music"
onready var Alarm = $"%Alarm"



var checking = false



func _ready():
	
	Lose.hide()
	
	var _err = Events.connect("on_guard_front_door", self, "jailChecking")



func _process(_delta):
	
	if checking and not isCheckingOk() and not Lose.visible:
		Lose.show()
		
		Jail.stop()
		Player.set_process(false)
		
		Music.stop()
		Alarm.play()
		yield(get_tree().create_timer(3.0), "timeout")
		Alarm.stop()
	


func jailChecking(status):
	checking = status
	


func _on_Outside_on_EscapeArea_body_entered():
	pass # TODO c'est la fin du jeu, niveau suivant



func isCheckingOk():
	return Jail.isOkForChecking() and not Player.isCarryingSomething()
