extends Area2D

@export var follow = false
@export var limit_left = 200
@export var limit_right = -760
@export var limit_top = 915
@export var limit_bottom = -620
@export var limit_deadspace = 20

var screen_size;
var original_link_position;
var level_size;
var link_size;

func _ready() -> void:
	screen_size = get_viewport_rect().size
	original_link_position = $Link.global_position	
	level_size = $BG.get_child(0).texture.get_size()
	link_size = $Link.get_child(0).sprite_frames.get_frame_texture("idle", 0).get_size()
	position.x = $Link.position.x * -1
	position.y = $Link.position.y * -1
	
func _process(delta: float) -> void:
	if TeleportParameters.done == false:
		return	
				
	if follow:
		var delta_x = $Link.get_position_delta().x
		var delta_y = $Link.get_position_delta().y
			
		if delta_x != 0:
			position.x -= delta_x;
		
		if delta_y != 0:
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
		if link_position.x < 0 - limit_deadspace:
			position.x = limit_left	
		if link_position.x > 0 + limit_deadspace:
			position.x = limit_right
		if link_position.y < 0 - limit_deadspace:
			position.y = limit_top
		if link_position.y > 0 + limit_deadspace:
			position.y = limit_bottom
