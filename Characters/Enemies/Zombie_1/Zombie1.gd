extends "res://Characters/CharacterTemplate/CharacterTemplate.gd"

#character attributes.
var Zombie_Speed = 100
	
#path finding.
var player = null

#reinitalize parent variables to character attributes.
func _ready():
	SPEED = Zombie_Speed

func _process(delta):
	var velocity = Vector2.ZERO
		
	#Enemy Path Finding, check if player var is true (this is set to true when the player collison box enters a zombies) # Sets velocity to the position of the player.
	if player != null:
		velocity = position.direction_to(player.position) * SPEED
		
	move_and_slide(velocity.normalized() * SPEED)
	#Parent method
	character_animation(velocity)

#path finding detection signals

#check if player has entered a zombie area2d collision radius.
func _on_Area2D_body_entered(body):
	if body != self:
		player = body

#check if player has exited a zombies area2d radius.
func _on_Area2D_body_exited(body):
	player = null
