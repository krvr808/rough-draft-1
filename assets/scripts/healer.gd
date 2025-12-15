extends Area2D







func _on_body_entered(body: Node2D) -> void:
	var player: Player = (body as Player);
	player.heal_damage()
	queue_free()
