extends Node

const ZOMBIE = preload("res://Characters/Enemies/Zombie_1/Zombie1.tscn")

func _ready():
	$YSort/Player.position = $PlayerStartPos.position
	
func _process(delta):
	var player_pos = $"YSort/Player".position
	Global.player_pos = player_pos
	

func zombie_spawn(start_pos):
	var zombie = ZOMBIE.instance()
	var zombie_start_node_name = "ZombieStartPos/StartPos" + str(start_pos)
	zombie.position = get_node(zombie_start_node_name).position
	$YSort.add_child(zombie)

func _on_Timer1_timeout():
	
	get_node("ZombieSpawnTimer/Timer1").wait_time = (rand_range(1,4))
	zombie_spawn(round(rand_range(1,5)))

	

