extends Camera3D

@export var speed:float = 0.1
@export var maxY:float = 0
@export var creditsSpeed:float = 2

func _process(delta: float) -> void:
	if position.y <= maxY:
		translate(-transform.basis.y * speed * delta)
		
		var credits = get_parent().get_child(0)
		if credits.position.y > -2200:
			credits.position.y = credits.position.y-creditsSpeed
	else:
		TeleportParameters.Teleport("start")

func _on_ready() -> void:
	PauseUi.canPause = false
	MusicManager.PlayMusic("intro");
