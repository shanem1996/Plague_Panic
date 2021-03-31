extends KinematicBody2D

var health
var max_health = 10
var speed = 240

func setMaxHealth(max_health):
	health = clamp(max_health, 0, max_health)
	
func setCharSpeed(new_Speed):
	speed = new_Speed

#character animation used for most characters based on velocity.
func character_animation(velocity):
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
