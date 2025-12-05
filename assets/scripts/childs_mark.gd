class_name ChildsMark extends HBoxContainer

enum modes {yeschild, nochild}

var CHILDGONE = preload("res://assets/sprites/Childgone.png")
const CHILD = preload("res://assets/sprites/Child.png")

@export var mode : modes

var kidcount = 0

func update_yeschild(value):
	match mode:
		modes.yeschild:
			update_yeschild(value)
		modes.nochild:
			update_nochild(value)
			
func update_full(value):
	for i in get_child_count():
		get_child(i).visible = value > i


func update_nochild(value):
	for i in get_child_count():
		if value > i:
			get_child(i).texture = CHILD
		else:
			get_child(i).texture = CHILDGONE
