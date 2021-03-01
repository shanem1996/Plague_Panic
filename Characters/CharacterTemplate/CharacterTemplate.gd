extends KinematicBody2D

var speed = 240
const MAX_SPEED = 100
const FRICTION = 0.1
var health = 10

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
