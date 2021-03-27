extends RigidBody2D

func _physics_process(delta):
	pass

func kill_enemy():
	pass

func _on_Bullet_Timer_timeout():
	queue_free()


func _on_Bullet_1_body_entered(body):
	queue_free()
