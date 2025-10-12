extends Area2D

var isTouched:bool = false
var destroyed:bool = false
@export var isTunnel:bool = false
@export var teleportMap:String = "asukave"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = true

func _on_body_exited(body: Node2D) -> void:
	isTouched = false

func change_scene_safe():
	TeleportParameters.done = false
	TeleportParameters.x = 1
	TeleportParameters.y = 1
	get_tree().change_scene_to_file("res://Assets/Levels/"+teleportMap+".tscn")

func _process(delta: float) -> void:
	
	if destroyed && isTunnel && isTouched:
		call_deferred("change_scene_safe")
		return
		
	if destroyed:
		return
	
	if isTouched && Parameters.attacking:	
		$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
		
		var textureName = "bush-stump"
		
		if isTunnel:
			textureName = "stairs"
			isTouched = false
		
		var t = load("res://Assets/Sprites/"+textureName+".png")
		$StaticBody2D/Sprite2D.texture = t;
		destroyed = true
