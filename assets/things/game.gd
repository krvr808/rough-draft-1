extends Node2D

@onready var Game = get_tree().get_root().get_node("Game")
@onready var projectile = load("res://assets/sprites/projectile.png")







# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	shoot()

#func shoot():
#	var instance = projectile.instantiate()
#	instance.dir = rotation
#	instance.spawnPos = global_position
#	instance.spawnRot = global_rotation
#	Game.add_child.call_deferred(instance)
