extends Node

const ZOMBIE = preload("res://Characters/Enemies/Zombie_1/Zombie1.tscn")

func _ready():
	var healthBar = $"UI/healthBar"
	Global.roundLabel = $"UI/roundLabel"
	Global.current_round = 1
	$YSort/Player.position = $PlayerStartPos.position
	Global.roundLabel.visible = false
	newRound()
	
func _process(delta):
	var roundLabel = $"UI/roundLabel"
	var player_pos = $"YSort/Player".position
	Global.player_pos = player_pos
	
	if Global.zombiesDefeated >= Global.zombieCount:
		Global.current_round += 1
		Global.zombiesDefeated = 0
		Global.zombieCount = Global.current_round * 10
		newRound()
		yield(get_tree().create_timer(6),"timeout")
	
		

func zombie_spawn(start_pos):
	var zombie = ZOMBIE.instance()
	var zombie_start_node_name = "ZombieStartPos/StartPos" + str(start_pos)
	zombie.position = get_node(zombie_start_node_name).position
	$YSort.add_child(zombie)
	
func newRound():
	Global.roundLabel.visible = true
	var counter = 6
	for i in range(5,0,-1):
		Global.roundLabel.text = "Round Starting:- "+ str(i)
		counter -= 1
		yield(get_tree().create_timer(1), "timeout")
	if counter == 1:
			Global.roundLabel.text = "Round: " + str(Global.current_round)
			for j in range(0,Global.zombieCount,+1):
				zombie_spawn(round(rand_range(1,12)))
				yield(get_tree().create_timer(rand_range(1,4)), "timeout")
				
		
	
