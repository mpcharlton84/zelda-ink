extends AudioStreamPlayer2D

var BreakSound = preload("res://Assets/Sounds/break.wav");
var BushSound = preload("res://Assets/Sounds/bush.wav");
var MessageSound = preload("res://Assets/Sounds/message.wav");
var ObjectSound = preload("res://Assets/Sounds/object.wav");
var RupeeSound = preload("res://Assets/Sounds/rupee.wav");
var SwordSound = preload("res://Assets/Sounds/sword.wav");

func PlaySound(name:String) -> void:
	if name == 'break':
		stream = BreakSound
	elif name == 'bush':
		stream = BushSound
	elif name == 'message':
		stream = MessageSound
	elif name == 'object':
		stream = ObjectSound
	elif name == 'rupee':
		stream = RupeeSound
	else:
		stream = SwordSound
	play()
