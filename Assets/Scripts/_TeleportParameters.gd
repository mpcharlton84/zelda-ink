extends Node

var x: int
var y: int
var done: bool = false

func Teleport(sceneName:String, destinationX:int = 0, destinationY:int = 0) -> void:
	Parameters.canMove = false
	TransitionScreen.fade_to_black()
	await TransitionScreen.on_transition_finished
	done = false
	x = destinationX
	y = destinationY
	call_deferred("change_scene_safe", sceneName)

func change_scene_safe(sceneName):
	get_tree().change_scene_to_file("res://Assets/Scenes/"+sceneName+".tscn")
	await get_tree().create_timer(0.1).timeout
	TransitionScreen.fade_to_normal()
	Parameters.canMove = true
