extends CanvasLayer

#@onready var plantLeftButton = get_tree().get_first_node_in_group("plantLeftButton")
#@onready var plantUpButton = get_tree().get_first_node_in_group("plantUpButton")
#@onready var plantRightButton = get_tree().get_first_node_in_group("plantRightButton")
@onready var plantLeftButton = $MarginContainer/Panel/BoxContainer/VBoxContainer/HBoxContainer/HBoxContainer/left_button
@onready var plantUpButton = $MarginContainer/Panel/BoxContainer/VBoxContainer/HBoxContainer/HBoxContainer3/up_button
@onready var plantRightButton = $MarginContainer/Panel/BoxContainer/VBoxContainer/HBoxContainer/HBoxContainer2/right_button
@onready var essence_fill = $MarginContainer/Panel/BoxContainer/VBoxContainer/HBoxContainer2/essenceFill
@onready var plant_image = $MarginContainer/Panel/plant_window/plant

var plaque_static = preload("res://ui/textures/big_button_hover.png")
var plaque_highlighted = preload("res://ui/textures/big_button_hoverHighlight.png")
var button_sound = preload("res://assets/sounds/Click_Mouse.wav")

#@onready var progression_sound = preload("res://assets/sounds/AC_Correct_Answer_01v2.wav")
@onready var essence_sound = preload("res://assets/sounds/AC_Correct_Answer_01v2.wav")
@onready var audio_player = $AudioStreamPlayer
@onready var button_audio_player = audio_player.duplicate()

#@onready var currentPlot: Node2D
@onready var plantedSeed: String
# This little var may end up determining a LOT... like which whole minigames get loaded?
# Hmm I may want to move that logic to the UI manager and pass this seed name as a tag to load seperate UIs

#@onready var seedGrowthState: int

var sequencer: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().root.add_child.call_deferred(button_audio_player)
	audio_player.stream = essence_sound
	button_audio_player.stream = button_sound	
	self.visible = false

func _input(event):
	if event is InputEventMouseMotion:
		return
	match sequencer:
		0:
			if event.is_action_pressed("ui_left") && self.visible:
				plantLeftButton.texture = plaque_highlighted
				button_audio_player.play()
				sequencer += 1
				update_fill()
			else:
				plantLeftButton.texture = plaque_static
				sequencer = 0
				update_fill()
		1: 
			if event.is_action_pressed("ui_up") && self.visible:
				plantUpButton.texture = plaque_highlighted
				button_audio_player.play()
				sequencer += 1
				update_fill()
			else:
				plantUpButton.texture = plaque_static
				plantLeftButton.texture = plaque_static
				sequencer = 0
				update_fill()
		2: 
			if event.is_action_pressed("ui_right") && self.visible:
				plantRightButton.texture = plaque_highlighted
				button_audio_player.play()
				sequencer += 1
				update_fill()
			else:
				plantUpButton.texture = plaque_static
				plantLeftButton.texture = plaque_static
				plantRightButton.texture = plaque_static
				sequencer = 0
				update_fill()
		3:
			sequencer = 0
			audio_player.play() # Progression/Collection sound
			match plantedSeed:
				"blue1":
					DockController.essenceAdd(plantedSeed, 24)
				"red1":
					DockController.essenceAdd(plantedSeed, 13)
				"orange1":
					DockController.essenceAdd(plantedSeed, 9)
				"white1":
					DockController.essenceAdd(plantedSeed, 1)
			plantUpButton.texture = plaque_static
			plantLeftButton.texture = plaque_static
			plantRightButton.texture = plaque_static

	if event.is_action_pressed("ui_cancel") && self.visible:
		UiManager.toggle_ui(self, false)

func update_fill():
	essence_fill.value = sequencer * 10

func load_plant(plotSeed: String):
	plantedSeed = plotSeed
	if plantedSeed == "blue1":
		plant_image.texture = load("res://assets/plots/plotBlue_stage2.png")
	if plantedSeed == "red1":
		plant_image.texture = load("res://assets/plots/plotRed_stage2.png")
	if plantedSeed == "orange1":
		plant_image.texture = load("res://assets/plots/plotOrange_stage2.png")
	if plantedSeed == "white1":
		plant_image.texture = load("res://assets/plots/plotWhite_stage2.png")

func _on_ui_open():
	sequencer = 0

func _on_ui_close():
	#new_audio_player.queue_free()
	pass

func _on_close_button_pressed():
	UiManager.toggle_ui(self, false)
