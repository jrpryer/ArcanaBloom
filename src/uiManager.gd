extends Node

@onready var menu_active: bool
@onready var dev_debug_mode: bool


#func toggle_ui(ui_name: CanvasLayer, toggle: bool, tag: String):
func toggle_ui(ui_name: CanvasLayer, toggle: bool):
	if toggle:
		ui_name.visible = true 
		menu_active = true
		ui_name._on_ui_open()
			
	if !toggle:
		ui_name.visible = false
		menu_active = false
		ui_name._on_ui_close()
