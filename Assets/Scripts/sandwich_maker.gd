extends Area2D

var isTouched: bool = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = false

func _process(_delta: float) -> void:	
	if !Parameters.canMove && Input.is_action_just_pressed("sword"):
		DialogUI.HideDialog()
		Parameters.canMove = true
	elif isTouched && Parameters.canMove && Input.is_action_just_pressed("sword"):
		Parameters.canMove = false
		
		var text = "Hi, I'm the sandwich maker ! Bring me the three ingredients and I'll make Zelda's sandwich for you"
		
		if Parameters.inventory.has("sandwich"):
			text = "You already have the sandwich, take it to Zelda below the castle !"
		elif Parameters.inventory.size() == 3:
			text = "You have all the ingredients, here, there's a sandwich! Yum!"
			Parameters.inventory.append("sandwich");
		elif Parameters.inventory.size() > 0:
			text = "If you need help finding other ingredients, go see the Fortune Teller north of the village, she always helps me"
			
		DialogUI.ShowDialog(text, "message")
