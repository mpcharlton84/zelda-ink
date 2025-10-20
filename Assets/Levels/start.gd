extends Node2D

@export var speed:float = 0.01
var animated:bool = false

func _on_ready() -> void:
	$TextureRect2.modulate.a = 0
	await get_tree().create_timer(2).timeout
	animated = true

func change_scene_safe():
	get_tree().change_scene_to_file("res://Assets/Levels/house.tscn")

func _process(delta: float) -> void:
	if !animated && Input.is_action_just_pressed("sword"):
		change_scene_safe()
	
	if !animated:
		return;
	if $TextureRect2.modulate.a < 1:
		$TextureRect2.modulate.a = $TextureRect2.modulate.a+speed
	else:
		animated = false
