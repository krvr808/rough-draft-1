class_name Bullet extends Area2D



var projectilespeed : float = 0.5


func _physics_process(delta):
	position += self.position.rotated(self.rotation + PI) * projectilespeed * delta

func _on_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D):
	if body.is_in_group("Player"):
		var player: Player = (body as Player);
		player.take_damage();
		player.health;
		
		if player.health == 0:
			get_tree().reload_current_scene();
		
	queue_free()
	
