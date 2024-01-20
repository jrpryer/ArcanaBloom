extends Node

@onready var menu_active: bool
@onready var dev_debug_mode: bool

var water_ui = preload("res://ui/scenes/water_ui.tscn") #DEBUG
var plant_ui = preload("res://ui/scenes/plant_ui.tscn") #DEBUG
var door_ui = preload("res://ui/scenes/door_ui.tscn")
var book_ui = preload("res://ui/scenes/book_ui.tscn")

var book_ui_screen
var water_ui_screen
var plant_ui_screen
var door_ui_screen

func load_ui(ui_name: String):
	Character.reset_input()
	menu_active = true
	#ui_name._on_ui_open()
	match ui_name:
		"book_ui":
			book_ui_screen = book_ui.instantiate()
			get_tree().get_root().add_child(book_ui_screen)
			return book_ui_screen
		"water_ui":
			water_ui_screen = water_ui.instantiate()
			get_tree().get_root().add_child(water_ui_screen)
			return water_ui_screen
		"plant_ui":
			plant_ui_screen = plant_ui.instantiate()
			get_tree().get_root().add_child(plant_ui_screen)
			return plant_ui_screen
		"door_ui":
			door_ui_screen = door_ui.instantiate()
			get_tree().get_root().add_child(door_ui_screen)
			return door_ui_screen
	
func unload_ui(ui_name: String):
	#ui_name._on_ui_close()
	match ui_name:
		"water_ui":
			if water_ui_screen != null:
				water_ui_screen.queue_free()
		"plant_ui":
			if plant_ui_screen != null:
				plant_ui_screen.queue_free()
		"door_ui":
			if door_ui_screen != null:
				door_ui_screen.queue_free()

#func toggle_ui(ui_name: CanvasLayer, toggle: bool, tag: String):
func toggle_ui(ui_name: CanvasLayer, toggle: bool):
	if toggle:
		Character.reset_input()
		menu_active = true
		ui_name._on_ui_open()
		ui_name.visible = true 
			
	if !toggle:
		menu_active = false
		ui_name._on_ui_close()
		ui_name.visible = false

# Pausing the game on hitting esc
func _input(event):
	if event.is_action_pressed("ui_cancel") && !UiManager.menu_active && !get_tree().paused:
		#UiManager.toggle_ui(self, false)
		GameManager.pause_game()
	if event.is_action_pressed("ui_cancel") && UiManager.menu_active && get_tree().paused:
		GameManager.unpause_game()
