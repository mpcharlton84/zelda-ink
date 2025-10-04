extends Area2D

@export var follow = false
var screen_size;
var original_link_position;

func _ready() -> void:
	screen_size = get_viewport_rect().size
	original_link_position = $Link.global_position
	
func _process(delta: float) -> void:
	if follow:
		var delta_x = $Link.get_position_delta().x
		var delta_y = $Link.get_position_delta().y
		
		position.x -= delta_x;
		position.y -= delta_y;
		if position.x > 200 || position.x == 200:
			position.x = 200
		if position.x < -760:
			position.x = -760
		if position.y > 915:
			position.y = 915
		if position.y < -620:
			position.y = -620
			
		var link_position = $Link.global_position
		if link_position.x < original_link_position.x - 10:
			position.x = 200
		if link_position.x > original_link_position.x + 10:
			position.x = -760
		if link_position.y > original_link_position.y + 10:
			position.y = -620
		if link_position.y < original_link_position.y - 10:
			position.y = 915
