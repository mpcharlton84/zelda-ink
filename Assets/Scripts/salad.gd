extends Area2D

var isTouched:bool = false

func _on_ready() -> void:
	if Parameters.hasSacredMushroom:
		visible = false
		$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)

func _on_body_entered(body: Node2D) -> void:
	isTouched = true

func _on_body_exited(body: Node2D) -> void:
	isTouched = false

func _process(delta: float) -> void:

	if isTouched && Input.is_action_just_pressed("sword"):
		Parameters.hasSacredMushroom = true
		visible = false
		$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
