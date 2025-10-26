extends Node2D

func _process(_delta: float) -> void:
	PauseUi.canPause = false
	if Input.is_action_just_pressed("sword"):
		TeleportParameters.Teleport("start")
