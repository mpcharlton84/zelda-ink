extends Area2D

@export var scene: String = "overworld"
@export var x: int
@export var y: int

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Link":
		TeleportParameters.done = false
		TeleportParameters.x = x
		TeleportParameters.y = y
		call_deferred("change_scene_safe")

func change_scene_safe():
	get_tree().change_scene_to_file("res://Assets/Levels/"+scene+".tscn")
