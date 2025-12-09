class_name Child extends Area2D

@onready var childs_mark: HBoxContainer = $"../Player/HUD/ChildsMark"

var kidcount = 0
var child_count: int = 0;

func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	kidcount += 1
	print(kidcount)
	childs_mark.update_yeschild 
	queue_free()
	
