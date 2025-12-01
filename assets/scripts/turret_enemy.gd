extends Node2D

@onready var ray_cast: RayCast2D = $RayCast2D
@onready var bulletspawn: Timer = $bulletspawn
@export var ammo : PackedScene 

var player

func _ready():
	player = get_parent().find_child("Player")
	
func _physics_process(_delta):
	_aim()
	_check_player_collision()
	
func _aim():
	ray_cast.target_position = to_local(player.position)
	
func _check_player_collision():
	if ray_cast.get_collider() == player and bulletspawn.is_stopped():
		bulletspawn.start()





func _on_bulletspawn_timeout():
	_shoot()
	
func _shoot():
	var bullet: Bullet = ammo.instantiate()
	bullet.position = position
	
	var direction = player.position - ray_cast.global_position #ray_cast.position.angle_to(player.position);
	bullet.rotation = direction.angle();
	get_tree().current_scene.add_child(bullet)
	
	
	

	
	
	
