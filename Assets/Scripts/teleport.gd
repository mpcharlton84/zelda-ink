extends Area2D

@export var scene: String = "overworld";

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Link":
		print("Teleport to " + scene)
		get_tree().change_scene_to_file("res://Assets/Levels/"+scene+".tscn")
