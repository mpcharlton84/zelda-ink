extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if visible && body.name == "Link":
		visible = false
		$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
		SoundManager.PlaySound("rupee")
