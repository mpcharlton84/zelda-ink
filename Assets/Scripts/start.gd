extends Node2D

@export var speed:float = 0.01
var animated:bool = false

func _on_ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$TextureRect2.modulate.a = 0
	if !MusicManager.isPlaying:
		MusicManager.PlayMusic("intro");
	await get_tree().create_timer(2).timeout
	animated = true

func _process(_delta: float) -> void:
	if $TextureRect2.modulate.a >= 1 && !animated && Input.is_action_just_pressed("sword"):
		TeleportParameters.Teleport("intro")
	
	if !animated:
		return;
	elif $TextureRect2.modulate.a < 1:
		$TextureRect2.modulate.a = $TextureRect2.modulate.a+speed
	else:
		animated = false
