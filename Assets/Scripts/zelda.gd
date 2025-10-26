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
	
	if endGame && Input.is_action_just_pressed("sword"):
		DialogUI.HideDialog()
		TeleportParameters.Teleport("outro")
	elif !Parameters.canMove && Input.is_action_just_pressed("sword"):
		DialogUI.HideDialog()
		Parameters.canMove = true
	elif isTouched && Parameters.canMove && Input.is_action_just_pressed("sword"):
		Parameters.canMove = false
				
		if Parameters.inventory.has("sandwich"):
			DialogUI.ShowDialog("Oh my hero, thank you! You have saved my stomach (and your head). Great job, yay!", "message", "zeldaf-love")
			endGame = true
		elif Parameters.inventory.size() == 3:
			DialogUI.ShowDialog("You have all the ingredients, what are you waiting for? Make me my sandwich !!", "message", "zeldaf-mad")
		else:
			DialogUI.ShowDialog("Well ? Where's my food? Come on, chop chop !", "message", "zeldaf-mad")
