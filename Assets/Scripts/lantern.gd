extends Area2D

@export var burnName: String = "castle"

func _ready() -> void:
	if Parameters.burns.has(burnName):
		push()

func _on_body_entered(body: Node2D) -> void:	
	if body.name == "Link":
		push()
		Parameters.burns.append(burnName)
		if Parameters.burns.size() >= 3:
			Parameters.canMove = false
			(Parameters.link.get_child(0) as AnimatedSprite2D).play("default")
			MusicManager.StopMusic()
			await get_tree().create_timer(3).timeout
			change_scene_safe()

func push() -> void:
	SoundManager.PlaySound("break")
	$CollisionShape2D.set_deferred("disabled", true)
	$Sprite2D.texture = load("res://Assets/Sprites/burn.png");

func change_scene_safe():
	get_tree().change_scene_to_file("res://Assets/Levels/burned.tscn")
