extends Node

@onready var menu_active: bool
@onready var dev_debug_mode: bool


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
