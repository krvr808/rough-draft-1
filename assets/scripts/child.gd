extends Area2D

@onready var childs_mark: HBoxContainer = $"../Player/HUD/ChildsMark"

var kidcount = 0

func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	kidcount += 1
	print(kidcount)
	queue_free()
	
