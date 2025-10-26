extends Area2D

var isTouched:bool = false
@export var objectName:String = "meat"

func _on_ready() -> void:
	if Parameters.inventory.has(objectName):
		visible = false
		$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
	else:
		var t = load("res://Assets/Sprites/"+objectName+".png")
		$StaticBody2D/Sprite2D.texture = t;

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = false

func _process(_delta: float) -> void:
	if !visible:
		return;
	
	if !Parameters.canMove && Input.is_action_just_pressed("sword"):
		DialogUI.HideDialog()
		Parameters.canMove = true
		visible = false
	elif isTouched && Parameters.canMove && Input.is_action_just_pressed("sword"):
		Parameters.canMove = false
		Parameters.inventory.append(objectName)
		$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
		
		var text = "Weird"
		
		if objectName == "meat":
			text = "You have found old fairy meat. Yum."
		elif objectName == "salad":
			text = "You have found some funny looking salad."
			
		DialogUI.ShowDialog(text, "object")
