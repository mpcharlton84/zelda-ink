extends Area2D

@export var direction = "vertical"
@export var increasing = 1
@export var max: float = 0.0
@export var min: float = 0.0
@export var speed:float = 10

func _ready() -> void:
	print("ready")
	
func _process(delta: float) -> void:	
	if direction == "vertical":
		
		if position.y <= min:
			increasing = 1
		if position.y > max:
			increasing = -1
			
		position.y += increasing * speed
		
		$StaticBody2D/AnimatedSprite2D.flip_h = 0
		if increasing > 0:
			$StaticBody2D/AnimatedSprite2D.play("walk_down")
		else:
			$StaticBody2D/AnimatedSprite2D.play("walk_up")
	else:
		
		if position.x <= min:
			increasing = 1
		if position.x > max:
			increasing = -1
			
		position.x += increasing * speed
		
		if increasing > 0:
			$StaticBody2D/AnimatedSprite2D.flip_h = 0
			$StaticBody2D/AnimatedSprite2D.play("walk_right")
		else:
			$StaticBody2D/AnimatedSprite2D.flip_h = 1
			$StaticBody2D/AnimatedSprite2D.play("walk_right")
		
