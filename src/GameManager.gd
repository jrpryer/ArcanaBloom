extends Node

var main_menu_ui = preload("res://ui/scenes/mainMenu_ui.tscn") #DEBUG
var pause_menu_ui = preload("res://ui/scenes/pauseMenu_ui.tscn") #DEBUG


# Called when the node enters the scene tree for the first time.
func _ready():
	RenderingServer.set_default_clear_color(Color(0.44,0.12,0.53,1.00))
	

func start_game():
	if get_tree().paused:
		unpause_game()
		return

	SceneManager.tranition_to_scene("Room_1")


func exit_game():
	get_tree().quit()

func pause_game():
	get_tree().paused = true
	
	var pause_menu_screen = pause_menu_ui.instantiate()
	get_tree().get_root().add_child(pause_menu_screen)

func unpause_game():
	print("unpause?")
	get_tree().paused = false

func main_menu():
	var main_menu_screen = main_menu_ui.instantiate()
	get_tree().get_root().add_child(main_menu_screen)
