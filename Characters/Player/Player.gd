extends "res://Characters/CharacterTemplate/CharacterTemplate.gd"

#Player Attributes
var player_max_health = 10
var player_speed = 300

#Health Bar Signals
signal max_health
signal health_updated
	
func _ready():
	setMaxHealth(player_max_health)
	setCharSpeed(player_speed)
	emit_signal("max_health", health)

#Bullet
var bullet = preload("res://Weapons/Bullet/Bullet.tscn")
var cooldown = false
var takeDamageCooldown = false
var fire_rate = 0.4


#Boolean for whether the player is dead or not
var dead = false

#isDead function to check if the player has died
func isDead(dead):
	if dead == true:
		get_tree().change_scene("res://Game Over/GameOver.tscn") #If the player is dead the main menu scene is triggered

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

#Player health
func isPlayerDamaged(collision):
	if collision and takeDamageCooldown == false:
		if "Zombie1" in collision.collider.name:
			takeDamageCooldown = true
			health -= 1
			emit_signal("health_updated",health)
			print(health)
			yield(get_tree().create_timer(0.8), "timeout")
			takeDamageCooldown = false
	
	if health <= 0:
		dead = true
	
#_process fucntion runs for every instance of the game loop
func _process(delta):
	#Player movement
	var velocity = Vector2.ZERO
	
	#Player Collision
	var collision = move_and_collide(velocity * delta)
	
	if Input.is_action_pressed("player_down"):
		velocity.y += 1
		
	if Input.is_action_pressed("player_up"):
		velocity.y -= 1
	
	if Input.is_action_pressed("player_left"):
		velocity.x -= 1
		
	if Input.is_action_pressed("player_right"):
		velocity.x += 1
			
	#update player position each frame.
	move_and_slide(velocity.normalized() * speed)

	#is Player being attacked.
	isPlayerDamaged(collision)
	
	#Character method from CharacterTemplate.
	character_animation(velocity)
	
	#isDead function called.
	isDead(dead)
	
	#Shooting.
	Fire()
