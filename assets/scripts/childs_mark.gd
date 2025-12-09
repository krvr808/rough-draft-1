class_name ChildsMark extends HBoxContainer

enum modes {nochild, yeschild}

var CHILDGONE = preload("res://assets/sprites/Childgone.png")
var CHILD = preload("res://assets/sprites/Child.png")
var child_count: int = 0;
@onready var childgd = preload("res://assets/scripts/child.gd")

func update_children(value):
	for i in get_child_count():
		if(i >= value):
			break;
		var texture_rect: TextureRect = get_child(i)
		texture_rect.texture = CHILD;
