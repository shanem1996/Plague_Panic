extends "res://Characters/CharacterTemplate/CharacterTemplate.gd"

var bullet = preload("res://Weapons/Bullet/Bullet_1.tscn")
var bullet_speed = 900

#Boolean for whether the player is dead or not
var dead = false

#isDead function to check if the player has died
func isDead(dead):
	if dead == true:
		get_tree().change_scene("res://Main Menu/MainMenu.tscn") #If the player is dead the main menu scene is triggered

#_process fucntion runs for every instance of the game loop
func _process(delta):
	#Player movement
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("player_down"):
		velocity.y += 1
		
	if Input.is_action_pressed("player_up"):
		velocity.y -= 1
	
	if Input.is_action_pressed("player_left"):
		velocity.x -= 1
		
	if Input.is_action_pressed("player_right"):
		velocity.x += 1	
	
	move_and_slide(velocity.normalized() * speed)	
	
	#Character method from CharacterTemplate
	character_animation(velocity)
	
	#isDead function called
	isDead(dead)
	
	#Shooting
	if Input.is_action_just_pressed("player_attack"):
		var bullet_instance = bullet.instance()
		bullet_instance.position = position
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		
		
	
	#Player health
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		if "Zombie1" in collision.collider.name:
			health -= 0.05
			print(health)
	
	if health <= 0:
		health = 0
		dead = true
