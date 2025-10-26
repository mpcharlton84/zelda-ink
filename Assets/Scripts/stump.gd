extends Area2D

@export var swordHolder:bool = false
var isTouched: bool = false

func _ready() -> void:
	$StaticBody2D/Sword.visible = swordHolder

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = true
		
func _on_body_exited(body: Node2D) -> void:
	if body.name == "Link":
		isTouched = false

func _process(_delta: float) -> void:
	if !swordHolder:
		return
	
	if $StaticBody2D/Sword.visible && Parameters.hasSword:
		$StaticBody2D/Sword.visible = false
		
	if isTouched && Parameters.canMove && !Parameters.hasSword && Input.is_action_just_pressed("sword"):
		$StaticBody2D/Sword.visible = false
		Parameters.hasSword = true
		(Parameters.link.get_child(0) as AnimatedSprite2D).play("get_sword")
		SoundManager.PlaySound("sword")
