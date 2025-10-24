extends Node2D


func _on_ready() -> void:
	if MusicManager.currentMusic == "wind":
		MusicManager.StopMusic()
