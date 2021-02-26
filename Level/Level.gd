extends Node

const ZOMBIE = preload("res://Characters/Enemies/Zombie_1/Zombie1.tscn")


func _ready():
	$YSort/Player.position = $PlayerStartPos.position

func zombie_spawn(start_pos):
	var zombie = ZOMBIE.instance()
	var zombie_start_node_name = "ZombieStartPos/StartPos" + str(start_pos)
	zombie.position = get_node(zombie_start_node_name).position
	$YSort.add_child(zombie)
	
	var timer_node_name = "ZombieSpawnTimers/Timer" + str(start_pos)
	get_node(timer_node_name).wait_time = rand_range(1.5,2.5)

func _on_Timer1_timeout():
	zombie_spawn(1)


func _on_Timer2_timeout():
	zombie_spawn(2)


func _on_Timer3_timeout():
	zombie_spawn(3)


func _on_Timer4_timeout():
	zombie_spawn(4)


func _on_Timer5_timeout():
	zombie_spawn(5)
