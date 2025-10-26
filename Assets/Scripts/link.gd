extends CharacterBody2D

@export var speed:float = 400
var last_direction:String = "down"

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if TeleportParameters.x:
		position.x = TeleportParameters.x
	if TeleportParameters.y:
		position.y = TeleportParameters.y
	
	await get_tree().create_timer(0.05).timeout
	TeleportParameters.done = true

func get_input():

	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	var animation_direction = "default"
	var animation_flipped = last_direction == "left"
	
	if Input.is_action_pressed("down"):
		animation_direction = "down"
		animation_flipped = false
	elif Input.is_action_pressed("up"):
		animation_direction = "up"
		animation_flipped = false
	elif Input.is_action_pressed("right"):
		animation_direction = "right"
		animation_flipped = false
	elif Input.is_action_pressed("left"):
		animation_direction = "right"
		animation_flipped = true
			
	if Parameters.canMove && Input.is_action_just_pressed("sword") && Parameters.hasSword:
		velocity = Vector2.ZERO
		
		if animation_direction == "default":
			animation_direction = last_direction
			if last_direction == "left":
				animation_direction = "right"
				animation_flipped = true
		
		$Sprite.play("attack_"+animation_direction)
		$Sprite.flip_h = animation_flipped
		
		Parameters.attacking = true
		SoundManager.PlaySound("sword")
		await get_tree().create_timer(0.5).timeout
		Parameters.attacking = false
		return
		
	if Parameters.attacking:
		return
	
	velocity = input_direction * speed
		
	var animation_name = "idle_" + last_direction
	if animation_direction != "default":
		animation_name = "walk_"+animation_direction
		last_direction = animation_direction
		if animation_flipped:
			last_direction = "left"
	else:
		if last_direction == "left":
			animation_flipped = true
			animation_name = "idle_right"
						
	$Sprite.play(animation_name)
	$Sprite.flip_h = animation_flipped
	
func _physics_process(_delta: float) -> void:
	
	if !TeleportParameters.done || !Parameters.canMove:
		return
	
	if $Sprite.animation == "get_sword":
		Parameters.canMove = false
		await get_tree().create_timer(3).timeout
		last_direction = "down"
		await get_tree().create_timer(0.05).timeout
		Parameters.canMove = true
	
	get_input()
	move_and_slide()
