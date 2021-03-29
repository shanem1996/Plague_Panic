extends "res://Characters/CharacterTemplate/CharacterTemplate.gd"

#Bullet
var bullet = preload("res://Weapons/Bullet/Bullet.tscn")
var cooldown = false
var fire_rate = 0.4


#Boolean for whether the player is dead or not
var dead = false

#isDead function to check if the player has died
func isDead(dead):
	if dead == true:
		get_tree().change_scene("res://Main Menu/MainMenu.tscn") #If the player is dead the main menu scene is triggered

func Fire():
	if Input.is_action_pressed("player_attack") and cooldown == false:
		cooldown = true
		get_node("Axis").rotation = get_angle_to(get_global_mouse_position())
		var bullet_instance = bullet.instance()
		bullet_instance.position = get_node("Axis/BulletSpawn").get_global_position()
		bullet_instance.rotation = get_angle_to(get_global_mouse_position())
		get_tree().get_root().add_child(bullet_instance)
		yield(get_tree().create_timer(fire_rate), "timeout")
		cooldown = false

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
	Fire()
		
		
	
	#Player health
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		if "Zombie1" in collision.collider.name:
			health -= 0.05
	
	if health <= 0:
		health = 0
		dead = true
