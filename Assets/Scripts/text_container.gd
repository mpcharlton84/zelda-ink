extends Area2D

@export var texts = []
var isTouched: bool = false
var currentText: int = 0

func _on_ready() -> void:
	isTouched = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = false

func _process(_delta: float) -> void:
	if isTouched && Input.is_action_just_pressed("sword"):
					
		if currentText >= texts.size():
			currentText = 0
			isTouched = false
			DialogUI.HideDialog()
			Parameters.canMove = true
		else:
			Parameters.canMove = false
			var text = texts[currentText]
			DialogUI.ShowDialog(text, "message")
			currentText += 1
