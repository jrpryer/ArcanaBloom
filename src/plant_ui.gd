extends CanvasLayer

#@onready var fillBar = get_tree().get_first_node_in_group("waterFill")
#@onready var plant = get_tree().get_first_node_in_group("plant")
#@onready var particles = get_tree().get_first_node_in_group("particles")
#@onready var water_button = $MarginContainer/Panel/BoxContainer/VBoxContainer/HBoxContainer/water_button
#@onready var dock_control = get_tree().get_first_node_in_group("dockControl")
@onready var button_sound = preload("res://assets/sounds/Click_Mouse.wav")
@onready var essence_fill = $MarginContainer/Panel/BoxContainer/VBoxContainer/HBoxContainer2/essenceFill
@onready var plant_image = $MarginContainer/Panel/plant_window/plant

@onready var progression_sound = preload("res://assets/sounds/AC_Correct_Answer_01v2.wav")
@onready var audio_player = $AudioStreamPlayer
@onready var new_audio_player = audio_player.duplicate()

#@onready var currentPlot: Node2D
@onready var plantedSeed: String
# This little var may end up determining a LOT... like which whole minigames get loaded?
# Hmm I may want to move that logic to the UI manager and pass this seed name as a tag to load seperate UIs

#@onready var seedGrowthState: int

var sequencer: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().root.add_child.call_deferred(new_audio_player)
	audio_player.stream = progression_sound
	new_audio_player.stream = button_sound
	#self.visible = true #DEBUG
	#UiManager.menu_active = true #DEBUG
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if sequencer == 3:
		sequencer = 0
		audio_player.play()
		match plantedSeed: 
			"blue1":
				DockController.essenceAdd(plantedSeed, 53)
			"red1":
				DockController.essenceAdd(plantedSeed, 24)
			"orange1":
				DockController.essenceAdd(plantedSeed, 9)
			"white1":
				DockController.essenceAdd(plantedSeed, 1)
	
	if Input.is_action_just_released("left") || Input.is_action_just_released("up") || Input.is_action_just_released("right") || Input.is_action_just_released("down"):
		pass

func _input(event):
	match sequencer:
		0:
			if event.is_action_pressed("left") && self.visible:
				new_audio_player.play()
				sequencer += 1
				update_fill()
			else:
				sequencer = 0
				update_fill()
		1: 
			if event.is_action_pressed("up"):
				new_audio_player.play()
				sequencer += 1
				update_fill()
			else:
				sequencer = 0
				update_fill()
		2: 
			if event.is_action_pressed("right") && self.visible:
				new_audio_player.play()
				sequencer += 1
				update_fill()
			else:
				sequencer = 0
				update_fill()
	
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
	#essence_fill.value = 0

func _on_ui_close():
	#new_audio_player.queue_free()
	pass

func _on_close_button_pressed():
	#Input.action_press("ui_cancel")
	UiManager.toggle_ui(self, false)
