extends Camera3D

@export var speed:float = 0.1
@export var minY:float = 0

func _process(delta: float) -> void:
	if position.y <= minY:
		TeleportParameters.Teleport("house")
	else:
		translate(transform.basis.y * speed * delta)

func _on_ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	MusicManager.PlayMusic("wind")
