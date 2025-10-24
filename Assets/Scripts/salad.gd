extends Area2D

var isTouched:bool = false

func _on_ready() -> void:
	if Parameters.hasSacredMushroom:
		visible = false
		$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = false

func _process(_delta: float) -> void:

	if isTouched && Input.is_action_just_pressed("sword"):
		Parameters.hasSacredMushroom = true
		visible = false
		$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
