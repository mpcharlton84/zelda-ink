extends CharacterBody2D

@export var speed = 400

func _ready() -> void:
	if TeleportParameters.x:
		position.x = TeleportParameters.x
	if TeleportParameters.y:
		position.y = TeleportParameters.y
	TeleportParameters.done = true

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if Input.is_action_pressed("down"):
		$Sprite.play("walk_down")
	elif Input.is_action_pressed("up"):
		$Sprite.play("walk_up")
	elif Input.is_action_pressed("right"):
		$Sprite.play("walk_right")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		$Sprite.play("walk_right")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
		$Sprite.flip_h = false
	
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
