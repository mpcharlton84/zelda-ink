extends Area2D

var touching:bool = false
var destroyed:bool = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Link":
		touching = true

func _on_body_exited(body: Node2D) -> void:
	touching = false

func _process(delta: float) -> void:
	
	if destroyed:
		return
	
	if touching && Parameters.attacking:
		($StaticBody2D.get_child(1) as CollisionShape2D).set_deferred("disabled", true)
		var sprite2D = ($StaticBody2D.get_child(0) as Sprite2D)
		var t = load("res://Assets/Sprites/bush-stump.png")
		sprite2D.texture = t;
		destroyed = true
