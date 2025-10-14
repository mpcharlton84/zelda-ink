extends Camera3D

@export var speed:float = 0.1
@export var minY:float = 0

func _process(delta: float) -> void:
	if position.y <= minY:
		call_deferred("change_scene_safe")
	else:
		translate(transform.basis.y * speed * delta)

func change_scene_safe():
	get_tree().change_scene_to_file("res://Assets/Levels/house.tscn")
