class_name HeartContainers extends HBoxContainer

enum modes {full, empty}

var heart_empty = preload("res://assets/sprites/heartempty.png")
var heart_full = preload("res://assets/sprites/Herat-export.png")

@export var mode : modes

func update_health(value):
	match mode:
		modes.full:
			update_full(value)
		modes.empty:
			update_empty(value)
			
func update_full(value):
	for i in get_child_count():
		get_child(i).visible = value > i


func update_empty(value):
	for i in get_child_count():
		if value > i:
			get_child(i).texture = heart_full
		else:
			get_child(i).texture = heart_empty
