extends Area2D

var isTouched:bool = false
var endGame:bool = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = false

func _process(_delta: float) -> void:
	var panel = (get_parent().get_child(0) as TextureRect)
	
	if endGame && Input.is_action_just_pressed("sword"):
		TeleportParameters.Teleport("outro")
	elif !Parameters.canMove && Input.is_action_just_pressed("sword"):
		panel.visible = false
		Parameters.canMove = true
	elif isTouched && Input.is_action_just_pressed("sword"):
		Parameters.canMove = false
		
		var text = "Well ? Where's my food? Come on, chop chop !"
		
		if Parameters.inventory.has("sandwich"):
			text = "Oh my hero, thank you! You have saved my stomach (and your head). Great job, yay!"
			panel.texture = load("res://Assets/Sprites/zeldaf-love.png")
			endGame = true
		elif Parameters.inventory.size() == 3:
			text = "You have all the ingredients, what are you waiting for? Make me my sandwich !!"
		
		var textField = (panel.get_child(0) as Label)
		
		textField.text = text
		panel.visible = true
		SoundManager.PlaySound("message")
	
