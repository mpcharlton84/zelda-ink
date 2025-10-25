extends Area2D

var isTouched: bool = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = true
		print('touch')

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = false
		print('untouch')

func _process(_delta: float) -> void:
	var panel = (get_parent().get_child(0) as TextureRect)
	
	if !Parameters.canMove && Input.is_action_just_pressed("sword"):
		panel.visible = false
		Parameters.canMove = true
	elif isTouched && Input.is_action_just_pressed("sword"):
		Parameters.canMove = false
		
		var text = "The book is sealed."
		
		if !Parameters.hasSword:
			text = "The book is open on page 2, and it is written\n\"The hero will come and search for a sword. He will find it in the woods to the west of his home, where Zelda and Ganon had full tong action on that fateful night.\""
		elif !Parameters.inventory.has("meat"):
			text = "The book is open on page 6, and it is written\n\"The hero will come and search for meat. He will find it in the Fairy Swamps, in the old temple.\""
		elif !Parameters.inventory.has("cheese"):
			text = "The book is open on page 13, and it is written\n\"The hero will come and search for cheese. He will find it at the cemetary, forgotten on an anonymous tomb.\""
		elif !Parameters.inventory.has("salad"):
			text = "The book is open on page 42, and it is written\n\"The hero will come and search for salad. He will find it in a cave, hidden by nature, to the east of the sword.\""
		elif !Parameters.inventory.has("sandwich"):
			text = "The book is open on page 61, and it is written\n\"The hero will come and search for a sandwich. He should go and visit the sandwich maker to the south of here.\""
		else:
			text = "The book is open on the last page, and it is written\n\"The hero will come and search for Zelda. Come on dude! You've got all the rest! Find her by yourself!\""
		
		var textField = (panel.get_child(0) as Label)
		
		textField.text = text
		panel.visible = true
		
		SoundManager.PlaySound("message")
