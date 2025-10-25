extends AudioStreamPlayer2D

var BreakSound = preload("res://Assets/Sounds/break.wav");
var BushSound = preload("res://Assets/Sounds/bush.wav");
var MessageSound = preload("res://Assets/Sounds/message.wav");
var ObjectSound = preload("res://Assets/Sounds/object.wav");
var RupeeSound = preload("res://Assets/Sounds/rupee.wav");
var SwordSound = preload("res://Assets/Sounds/sword.wav");

func PlaySound(soundName:String) -> void:
	if soundName == 'break':
		stream = BreakSound
	elif soundName == 'bush':
		stream = BushSound
	elif soundName == 'message':
		stream = MessageSound
	elif soundName == 'object':
		stream = ObjectSound
	elif soundName == 'rupee':
		stream = RupeeSound
	else:
		stream = SwordSound
	play()
