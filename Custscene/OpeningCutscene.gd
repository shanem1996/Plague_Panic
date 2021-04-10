extends Control

onready var animationPlayer = get_node("AnimationPlayer")


func _ready():
	animationPlayer.play("Cutscene")


func _on_AnimationPlayer_animation_finished(Cutscene):
	get_tree().change_scene("res://Level/Level.tscn")
