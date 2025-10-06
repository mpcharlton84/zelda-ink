extends Area2D

@export var follow = false
@export var limit_left = 200
@export var limit_right = -760
@export var limit_top = 915
@export var limit_bottom = -620
@export var limit_deadspace = 10

var screen_size;
var original_link_position;

func _ready() -> void:
	screen_size = get_viewport_rect().size
	original_link_position = $Link.global_position
	
func _process(delta: float) -> void:
	if TeleportParameters.done == false:
		return	
			
	if follow:
		print($Link.position)
		var delta_x = $Link.get_position_delta().x
		var delta_y = $Link.get_position_delta().y
		
		position.x -= delta_x;
		position.y -= delta_y;
		if position.x > limit_left:
			position.x = limit_left
		if position.x < limit_right:
			position.x = limit_right
		if position.y > limit_top:
			position.y = limit_top
		if position.y < limit_bottom:
			position.y = limit_bottom
			
		var link_position = $Link.global_position
		if link_position.x < original_link_position.x - limit_deadspace:
			position.x = limit_left
		if link_position.x > original_link_position.x + limit_deadspace:
			position.x = limit_right
		if link_position.y < original_link_position.y - limit_deadspace:
			position.y = limit_top
		if link_position.y > original_link_position.y + limit_deadspace:
			position.y = limit_bottom
