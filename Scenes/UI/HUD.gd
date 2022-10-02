extends Control


onready var GuardsRounds = $"%GuardsRounds"


func setGuardsRounds(value):
	GuardsRounds.text = "Guard's rounds : " + str(value)
