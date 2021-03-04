extends "res://Characters/CharacterTemplate/CharacterTemplate.gd"

#character attributes.
var zombieSpeed = 100

#reinitalize parent variables to character attributes.
func _ready():
	speed = zombieSpeed

func _process(delta):
	var velocity = Vector2.ZERO
		
	#Enemy Path Finding, check if player var is true (this is set to true when the player collison box enters a zombies) # Sets velocity to the position of the player.
	velocity = position.direction_to(Global.player_pos) * speed
		
	move_and_slide(velocity.normalized() * speed)
	#Parent method
	character_animation(velocity)
