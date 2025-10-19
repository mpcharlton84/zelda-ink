extends Area2D

var isTouched: bool = false

func _on_body_entered(body: Node2D) -> void:
	isTouched = true


func _on_body_exited(body: Node2D) -> void:
	isTouched = false

func _process(delta: float) -> void:

	var panel = (get_parent().get_child(0) as TextureRect)
	
	if !Parameters.canMove && Input.is_action_just_pressed("sword"):
		panel.visible = false
		Parameters.canMove = true
	elif isTouched && Input.is_action_just_pressed("sword"):
		Parameters.canMove = false
		
		var text = "Hi, I'm the sandwich maker ! Bring me the three ingredients and I'll make Zelda's sandwich for you"
		
		if Parameters.hasSandwich:
			text = "You already have the sandwich, take it to Zelda below the castle !"
		elif Parameters.hasForbiddenFruit && Parameters.hasFairyMeat && Parameters.hasSacredMushroom:
			text = "You have all the ingredients, here, there's a sandwich! Yum!"
			Parameters.hasSandwich = true
		else:
			text = "If you need help finding over ingredients, go see the Fortune Teller, she always helps me"
		
		var textField = (panel.get_child(0) as Label)
		
		textField.text = text
		panel.visible = true
