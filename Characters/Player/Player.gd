extends "res://Characters/CharacterTemplate/CharacterTemplate.gd"

var dead = false

func isDead(dead):
	if dead == true:
		get_tree().change_scene("res://Main Menu/MainMenu.tscn")

func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("player_down"):
		velocity.y += 1
		
	if Input.is_action_pressed("player_up"):
		velocity.y -= 1
	
	if Input.is_action_pressed("player_left"):
		velocity.x -= 1
		
	if Input.is_action_pressed("player_right"):
		velocity.x += 1	
		
	#print(velocity)
		
	move_and_slide(velocity.normalized() * speed)	
	#Parent method
	character_animation(velocity)
	
	isDead(dead)
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		if "Zombie1" in collision.collider.name:
			health -= 0.05
			print(health)
	
	if health <= 0:
		health = 0
		dead = true
