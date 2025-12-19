class_name Bullet extends Area2D



var projectilespeed : float = 160


func _physics_process(delta):
	global_position += Vector2.LEFT.rotated(rotation + PI) * projectilespeed * delta

func _on_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D):
	if body.is_in_group("Player"):
		var player: Player = (body as Player);
		player.take_damage();
		player.health;
		
		if player.health == 0:
			#get_tree().reload_current_scene();
			player.global_position = Vector2(69,32)
			player.health = 3
		
	queue_free()
	
