extends Node

const ZOMBIE = preload("res://Characters/Enemies/Zombie_1/Zombie1.tscn")

func _ready():
	newRound()
	$YSort/Player.position = $PlayerStartPos.position
	var label = $"YSort/Player/Control/Label"
	label.visible = false
	
func _process(delta):
	var player_pos = $"YSort/Player".position
	Global.player_pos = player_pos
	var roundLabel = $"YSort/Player/Control/Label"
	roundLabel.text = "Round Starting : " + str(Global.round_timer)
	
	if Global.round_timer <= 3:
		roundLabel.visible = true
	
	if Global.round_timer <= 0:
		$"ZombieSpawnTimer/LabelTimer".stop()
		roundLabel.text = "Round 1"
		

func zombie_spawn(start_pos):
	var zombie = ZOMBIE.instance()
	var zombie_start_node_name = "ZombieStartPos/StartPos" + str(start_pos)
	zombie.position = get_node(zombie_start_node_name).position
	$YSort.add_child(zombie)

func _on_RoundStartTimer_timeout():
	$"ZombieSpawnTimer/SpawnTimer".start()

func _on_SpawnTimer_timeout():
	get_node("ZombieSpawnTimer/SpawnTimer").wait_time = (rand_range(1,4))
	zombie_spawn(round(rand_range(1,5)))
	
func _on_LabelTimer_timeout():
	Global.round_timer -= 1
	
func newRound():
	Global.round_timer = 3
	
