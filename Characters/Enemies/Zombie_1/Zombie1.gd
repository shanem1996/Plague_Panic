extends "res://Characters/CharacterTemplate/CharacterTemplate.gd"

#Attributes
var zombieSpeed = 100
var dead = false

#_ready runs once when the scene loads
func _ready():
	speed = zombieSpeed

func damage():
	health -= 5
	print("Hit")
	
	if health <= 0:
		health = 0
		dead = true

func isDead(dead):
	if dead == true:
		queue_free()

func _process(delta):
	var velocity = Vector2.ZERO
	
	#Sets zombie's velocity using direction_to method to player position
	velocity = position.direction_to(Global.player_pos) * speed
		
	move_and_slide(velocity.normalized() * speed)
	#Parent method
	character_animation(velocity)
	
	var bullet_collision = move_and_collide(velocity * delta)
	isDead(dead)
	

	

