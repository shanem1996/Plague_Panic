extends Node

const ZOMBIE = preload("res://Characters/Enemies/Zombie_1/Zombie1.tscn")

func _ready():
	var healthBar = $"UI/healthBar"
	var roundLabel = $"UI/roundLabel"
	var current_round = 0
	$YSort/Player.position = $PlayerStartPos.position
	roundLabel.visible = false
	newRound(roundLabel,current_round)
	
func _process(delta):
	var roundLabel = $"UI/roundLabel"
	var player_pos = $"YSort/Player".position
	Global.player_pos = player_pos
		

func zombie_spawn(start_pos):
	var zombie = ZOMBIE.instance()
	var zombie_start_node_name = "ZombieStartPos/StartPos" + str(start_pos)
	zombie.position = get_node(zombie_start_node_name).position
	$YSort.add_child(zombie)

func _on_SpawnTimer_timeout():
	get_node("ZombieSpawnTimer/SpawnTimer").wait_time = (rand_range(1,4))
	zombie_spawn(round(rand_range(1,5)))
	
func newRound(roundLabel,current_round):
	roundLabel.visible = true
	var counter = 6
	for i in range(5,-1,-1):
		roundLabel.text = "Round Starting: "+ str(i)
		counter -= 1
		print(counter)
		if counter == 0:
			roundLabel.text = "Round: " + str(current_round + 1)
			$"ZombieSpawnTimer/SpawnTimer".start()
		yield(get_tree().create_timer(1), "timeout")
	
		
	
