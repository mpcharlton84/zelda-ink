extends Area2D

var isTouched:bool = false
var destroyed:bool = false
@export var isTunnel:bool = false
@export var teleportMap:String = "asukave"
@export var x: int
@export var y: int

func _ready() -> void:
	if isTunnel && Parameters.foundTunnels.has(teleportMap):
		destroyed = true
		isTunnel = true
		$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
		$StaticBody2D/Sprite2D.texture = load("res://Assets/Sprites/stairs.png");

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = false

func _process(_delta: float) -> void:
	if destroyed && isTunnel && isTouched:
		TeleportParameters.Teleport(teleportMap, x, y)
		return
		
	if destroyed:
		return
	
	if isTouched && Parameters.canMove && Parameters.attacking:	
		$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
		
		var textureName = "bush-stump"
		
		if isTunnel:
			textureName = "stairs"
			isTouched = false
			Parameters.foundTunnels.append(teleportMap)
		
		var t = load("res://Assets/Sprites/"+textureName+".png")
		$StaticBody2D/Sprite2D.texture = t;
		destroyed = true
		SoundManager.PlaySound("bush")
		
		if !isTunnel && randi() & 1 == 1:
			$Rupee.visible = true
		else:
			$Rupee/StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
