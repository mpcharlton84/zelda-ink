extends Area2D

@export var scene: String = "overworld"
@export var x: int
@export var y: int

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Link":
		TeleportParameters.Teleport(scene, x, y)
