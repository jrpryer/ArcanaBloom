extends Node

var scene_transition = preload("res://scenes/SceneTransition.tscn")

var scenes: Dictionary = { 
	"Debug":"res://scenes/GardenEntrance.tscn",
	"Room_1":"res://scenes/rooms/Room_1.tscn",
	"Room_2":"res://scenes/rooms/Room_2.tscn"
	}


func transition_to_scene(room: String):
	var scene_path: String = scenes.get(room)
	
	if scene_path != null:
		var scene_transition_screen = scene_transition.instantiate()
		get_tree().get_root().add_child(scene_transition_screen)
		await get_tree().create_timer(1.0).timeout
		#var loadedRoom = load(scene_path)
		#get_tree().change_scene_to_packed(loadedRoom)
		get_tree().change_scene_to_file(scene_path)
		#DialogManager.connect_new_scene()
		#SeedsBar.connect_new_scene()
		InteractionManager.connect_new_scene()
		scene_transition_screen.queue_free()
		
