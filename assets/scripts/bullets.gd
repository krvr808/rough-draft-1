extends Area2D

var projectiledirection : Vector2 = Vector2.RIGHT
var projectilespeed : float = 300

func _physics_process(delta):
	position += projectiledirection * projectilespeed *delta

func _on_screen_exited() -> void:
	pass # Replace with function body.
