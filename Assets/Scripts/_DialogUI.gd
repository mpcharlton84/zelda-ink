extends CanvasLayer

func _on_ready() -> void:
	visible = false
	
func ShowDialog(text:String, sound:String = "", texture:String = "") -> void:
	PauseUi.canPause = false
	$Label.text = text
	visible = true
	
	if sound != "":
		SoundManager.PlaySound(sound)
		
	if texture != "":
		$TextureRect.texture = load("res://Assets/Sprites/"+texture+".png")
	
func HideDialog() -> void:
	PauseUi.canPause = true
	visible = false
