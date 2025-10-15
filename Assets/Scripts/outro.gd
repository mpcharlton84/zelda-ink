extends Camera3D

@export var speed:float = 0.1
@export var maxY:float = 0

func _process(delta: float) -> void:
	if position.y <= maxY:
		translate(-transform.basis.y * speed * delta)
