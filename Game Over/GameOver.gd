extends Control

func _ready():
	get_node("DeathSound").play()
	get_node("AnimationPlayer").play("GameOver")
	

func _process(delta):
	gameOverRound()

func gameOverRound():
	var roundTxt = "You made it to round " + str(Global.current_round)
	
	$"Menu/Text/RoundLabel".text = roundTxt
	


