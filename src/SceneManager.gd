extends Node

var scenes: Dictionary = { "Room_1":"res://scenes/rooms/Room_1.tscn",
						   "Room_2":"res://scenes/rooms/Room_2.tscn"}


func transition_to_scene(room: String):
	var scene_path: String = scenes.get(room)
	
	if scene_path != null:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file(scene_path)
