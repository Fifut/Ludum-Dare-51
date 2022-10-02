extends Node2D



onready var Jail = $"%Jail"
onready var Player = $"%Player"
onready var Lose = $"%Lose" 
onready var Win = $"%Win"
onready var Music = $"%Music"
onready var Alarm = $"%Alarm"


var checking = false
var _guard_round = 0


func _ready():
	
	Lose.hide()
	Win.hide()
	
	var _err = Events.connect("on_guard_front_door", self, "_jailChecking")
	_err = Events.connect("on_clock_timeout", self, "_guardRound")



func _process(_delta):
	
	if checking and not isCheckingOk() and not Lose.visible:
		Lose.show()
		
		Jail.stop()
		Player.set_process(false)
		
		Music.stop()
		Alarm.play()
		yield(get_tree().create_timer(3.0), "timeout")
		Alarm.stop()
	
	
	
func _guardRound():
	_guard_round += 1



func _jailChecking(status):
	checking = status
	


func _on_Outside_on_EscapeArea_body_entered():
	
	Win.show()
	Win.setScore(_guard_round)
		
	Jail.stop()
	Player.set_process(false)
		
	Music.stop()
#	Alarm.play()
#	yield(get_tree().create_timer(3.0), "timeout")
#	Alarm.stop()



func isCheckingOk():
	return Jail.isOkForChecking() and not Player.isCarryingSomething()
