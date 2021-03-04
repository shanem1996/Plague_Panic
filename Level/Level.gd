extends Node

const ZOMBIE = preload("res://Characters/Enemies/Zombie_1/Zombie1.tscn")

func _ready():
	$YSort/Player.position = $PlayerStartPos.position
	var label = $"YSort/Player/Control/Label"
	label.visible = false
	
func _process(delta):
	var player_pos = $"YSort/Player".position
	Global.player_pos = player_pos
	$"YSort/Player/Control/Label".text = "Round Starting : " + str(Global.round_timer)
	
	if Global.round_timer >= 1:
		var label = $"YSort/Player/Control/Label"
		label.visible = true
	
	if Global.round_timer >= 3:
		$"ZombieSpawnTimer/LabelTimer".stop()

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
	Global.round_timer += 1
	
