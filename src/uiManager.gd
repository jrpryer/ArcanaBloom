extends Node

@onready var menu_active: bool


#func toggle_water_ui(toggle: bool):
	#if toggle:
		#water_ui.visable = true
		#menu_active = true
	#if !toggle:
		#water_ui.visable = false
		#menu_active = false

func toggle_ui(ui_name: CanvasLayer, toggle: bool, tag: String):
	if toggle:
		ui_name.visible = true
		menu_active = true
		if tag == "water_ui":
			ui_name.ui_open()
	if !toggle:
		ui_name.visible = false
		menu_active = false
