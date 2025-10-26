extends CanvasLayer

var canPause:bool = false

func _on_ready() -> void:
	visible = false

func _process(_delta: float) -> void:
	if visible == false && canPause && Input.is_action_just_pressed("pause"):
		Parameters.canMove = false
		update_stats()
		visible = true
	elif visible == true && Input.is_action_just_pressed("pause"):
		Parameters.canMove = true
		visible = false

func update_stats() -> void:
	var swordText = "Sword found: "
	var progresssionText = "Sandwich progression: "
	
	if Parameters.hasSword:
		swordText += "yes !"
	else:
		swordText += "no :("
	$LabelSword.text = swordText
	
	if Parameters.inventory.size() < 3:
		progresssionText += "missing " + str(3 - Parameters.inventory.size()) + " ingredients"
	elif Parameters.inventory.size() == 3:
		progresssionText = "all ingredients found !"
	else:
		progresssionText = "done !"
	$LabelProgression.text = progresssionText
	
	$LabelLanterns.text = "Lanterns pushed: " + str( Parameters.burns.size() ) + "/3"
	$LabelRupees.text = "Rupees: " + str(Parameters.rupees)
		
