extends "res://Characters/CharacterTemplate.gd"

func _process(delta):
	var velocity = Vector2.ZERO
		
	print(velocity)
		
	move_and_slide(velocity.normalized() * SPEED)	
	
	player_animation(velocity)
	
func player_animation(velocity):
	if velocity.y < 0  and velocity.x > 0:
		$AnimatedSprite.play("Walk_Diagonal_Up")
		$AnimatedSprite.flip_h = false
		
	elif velocity.y < 0  and velocity.x < 0:
		$AnimatedSprite.play("Walk_Diagonal_Up")
		$AnimatedSprite.flip_h = true
		
	elif velocity.y < 0:
		$AnimatedSprite.play("Walk_Up")
		
	elif velocity.y > 0  and velocity.x > 0:
		$AnimatedSprite.play("Walk_Diagonal_Down")
		$AnimatedSprite.flip_h = false
		
	elif velocity.y > 0  and velocity.x < 0:
		$AnimatedSprite.play("Walk_Diagonal_Down")
		$AnimatedSprite.flip_h = true
		
	elif velocity.y > 0:
		$AnimatedSprite.play("Walk_Down")
		
	elif velocity.x != 0:
		$AnimatedSprite.play("Walk_Side")
		$AnimatedSprite.flip_h = velocity.x < 0
		
	else:
		$AnimatedSprite.play("Idle")
