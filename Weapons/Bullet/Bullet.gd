extends RigidBody2D

var bullet_speed = 400

func _ready():
	apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
	get_node("Lifetime").start()

func _on_Bullet_body_entered(body):
	if body.is_in_group("zombie"):
		body.takeDamage()
	queue_free()

func _on_Lifetime_timeout():
	queue_free()
