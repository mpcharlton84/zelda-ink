extends CanvasLayer


func _on_ready() -> void:
	visible = OS.has_feature("web_android") || OS.has_feature("web_ios") || OS.has_feature("android")
