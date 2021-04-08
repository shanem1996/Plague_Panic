extends Control

func _process(delta):
	gameOverRound()

func gameOverRound():
	var roundTxt = "You made it to round " + str(Global.current_round)
	
	$"Menu/Text/RoundLabel".text = roundTxt
	


