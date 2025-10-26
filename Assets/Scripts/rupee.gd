extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if visible && body.name == "Link":
		visible = false
		SoundManager.PlaySound("rupee")
		Parameters.rupees = Parameters.rupees + 1
