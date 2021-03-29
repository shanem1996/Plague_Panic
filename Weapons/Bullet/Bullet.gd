extends RigidBody2D

var bullet_speed = 400

func _ready():
	apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))

func _on_Bullet_body_entered(body):
	if body.is_in_group("zombie"):
		body.damage()
	queue_free()
