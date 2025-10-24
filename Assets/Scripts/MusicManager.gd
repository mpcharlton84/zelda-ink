extends AudioStreamPlayer2D

var isPlaying:bool = false
var currentMusic:String = ""

func PlayMusic(name:String) -> void:
	StopMusic()
	stream = load("res://Assets/Music/"+name+".mp3")
	play()
	isPlaying = true
	currentMusic = name
	set("loop", true)
	
func StopMusic() -> void:
	stop()
	isPlaying = false
