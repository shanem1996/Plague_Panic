extends "res://Characters/CharacterTemplate/CharacterTemplate.gd"

#Attributes
var zombie_Speed = 100
var zombie_Max_Health = 10
var dead = false

#_ready runs once when the scene loads
func _ready():
	setMaxHealth(zombie_Max_Health)
	setCharSpeed(zombie_Speed)

#called in bullet script.
func takeDamage():
	health -= 5
	
	if health <= 0:
		health = 0
		dead = true

func isDead(dead):
	if dead == true:
		Global.zombiesDefeated += 1
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
	

	

