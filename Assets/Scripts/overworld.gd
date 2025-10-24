extends Node2D

func _on_ready() -> void:
	if !MusicManager.isPlaying:
		MusicManager.PlayMusic("world")
