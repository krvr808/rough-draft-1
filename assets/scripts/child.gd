class_name Child extends Area2D

@onready var childs_mark: HBoxContainer = $"../Player/HUD/ChildsMark"

@export var player: Player;

func _ready() -> void:
	if(player == null):
		print("Trevor you dumbass add the player to the exported variable")
		assert(player!=null);

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	player.gain_child();
	queue_free()
