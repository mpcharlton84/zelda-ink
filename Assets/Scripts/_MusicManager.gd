extends AudioStreamPlayer2D

var isPlaying:bool = false
var currentMusic:String = ""

func PlayMusic(musicName:String) -> void:
	StopMusic()
	stream = load("res://Assets/Music/"+musicName+".mp3")
	play()
	isPlaying = true
	currentMusic = musicName
	set("loop", true)
	
func StopMusic() -> void:
	stop()
	isPlaying = false
