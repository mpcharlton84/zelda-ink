extends Node2D


func _on_ready() -> void:
	PauseUi.canPause = true
	if MusicManager.currentMusic == "wind":
		MusicManager.StopMusic()
