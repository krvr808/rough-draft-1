extends Sprite2D

@onready var player: Player = $"../Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if player.global_position.y + 180 < self.global_position.y:
		self.global_position.y = player.global_position.y + 180;
