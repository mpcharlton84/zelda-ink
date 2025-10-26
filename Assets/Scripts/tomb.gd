extends Area2D

var isTouched:bool = false
@export var hasCheese:bool = false

func _on_ready() -> void:
	
	if Parameters.inventory.has("cheese"):
		hasCheese = false
		$Cheese.visible = false
	elif hasCheese:
		$Cheese.visible = true

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = false

func _process(_delta: float) -> void:
	if !hasCheese:
		return
	
	if !Parameters.canMove && Input.is_action_just_pressed("sword"):
		DialogUI.HideDialog()
		Parameters.canMove = true
		hasCheese = false
	elif isTouched && Parameters.canMove && Input.is_action_just_pressed("sword"):
		Parameters.canMove = false
		Parameters.inventory.append("cheese")
		$Cheese.visible = false
		DialogUI.ShowDialog("You have found a bag full of old smelly meat. Yuk.", "object")
