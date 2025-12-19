extends Area2D


@onready var timer: Timer = $Timer
@export var player: Player


func _on_body_entered(body: Node2D) -> void:
	print("You Died")
	timer.start()

func _on_timer_timeout() -> void:
	player.global_position = Vector2(69,32)
	#get_tree().reload_current_scene()
	player.health = 3
