extends KinematicBody2D

#character attributes
var SPEED = 100

#path finding
var player = null


func _process(delta):
	var velocity = Vector2.ZERO
		
	if player != null:
		velocity = position.direction_to(player.position) * SPEED
		
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

#path finding
func _on_Area2D_body_entered(body):
	if body != self:
		player = body


func _on_Area2D_body_exited(body):
	player = null
