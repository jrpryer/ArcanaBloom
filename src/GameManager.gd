extends Node

var main_menu_ui = preload("res://ui/scenes/main_menu_ui.tscn") #DEBUG
var pause_menu_ui = preload("res://ui/scenes/pause_menu_ui.tscn") #DEBUG
var pause_menu_screen
#var main_HUD_ui = preload("res://ui/scenes/Main_HUD.tscn") #DEBUG


# Called when the node enters the scene tree for the first time.
func _ready():
	RenderingServer.set_default_clear_color(Color(0.333333, 0.419608, 0.184314, 1))
	
	SettingsManager.load_settings()

func start_game():
	if get_tree().paused:
		unpause_game()
		return

	SceneManager.transition_to_scene("Room_1")
	#var HUD = main_HUD_ui.instantiate()
	#get_tree().get_root().add_child(HUD)


func exit_game():
	get_tree().quit()

func pause_game():
	get_tree().paused = true
	UiManager.menu_active = true
	
	pause_menu_screen = pause_menu_ui.instantiate()
	get_tree().get_root().add_child(pause_menu_screen)

func unpause_game():
	if get_tree().paused && pause_menu_screen != null:
		get_tree().paused = false
		UiManager.menu_active = false
		pause_menu_screen.queue_free()
	elif get_tree().paused && pause_menu_screen == null:
		get_tree().paused = false
		

func main_menu():
	var main_menu_screen = main_menu_ui.instantiate()
	get_tree().get_root().add_child(main_menu_screen)


func start_debug():
	if get_tree().paused:
		unpause_game()
	SceneManager.transition_to_scene("Debug")
