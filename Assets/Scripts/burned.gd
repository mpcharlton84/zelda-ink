extends Node2D

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("sword"):
		change_scene_safe()

func change_scene_safe():
	get_tree().change_scene_to_file("res://Assets/Levels/start.tscn")
