extends Area2D

var isTouched:bool = false
@export var hasCheese:bool = false

func _on_ready() -> void:
	
	if Parameters.hasForbiddenFruit:
		hasCheese = false
		$Cheese.visible = false
	elif hasCheese:
		$Cheese.visible = true

func _on_body_entered(body: Node2D) -> void:
	isTouched = true

func _on_body_exited(body: Node2D) -> void:
	isTouched = false

func _process(delta: float) -> void:

	if hasCheese && isTouched && Input.is_action_just_pressed("sword"):
		Parameters.hasForbiddenFruit = true
		$Cheese.visible = false
