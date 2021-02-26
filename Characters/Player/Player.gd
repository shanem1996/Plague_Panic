extends "res://Characters/CharacterTemplate/CharacterTemplate.gd"

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
		
	move_and_slide(velocity.normalized() * SPEED)	
	#Parent method
	character_animation(velocity)

