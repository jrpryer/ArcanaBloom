extends CanvasLayer

@onready var fillBar = $MarginContainer/Panel/BoxContainer/VBoxContainer/HBoxContainer2/waterFill
@onready var plant_image = $MarginContainer/Panel/plant_window/plant
@onready var particles = $MarginContainer/Panel/plant_window/VBoxContainer/particles
@onready var water_button = $MarginContainer/Panel/BoxContainer/VBoxContainer/HBoxContainer/water_button
@onready var watering_sound = preload("res://assets/sounds/Splash Small 2_2.wav")

@onready var audio_player = $AudioStreamPlayer

@onready var currentPlot: Node2D
@onready var plantedSeed: String
@onready var seedGrowthState: int

# Called when the node enters the scene tree for the first time.
func _ready():
	audio_player.stream = watering_sound
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
# Modulate texture as plant grows/shrinks
	match plantedSeed:
		"blue1":
			match seedGrowthState:
				1: 
					plant_image.texture = load("res://assets/plots/plotBlue_stage1.png")
				2: 
					plant_image.texture = load("res://assets/plots/plotBlue_stage2.png")
				3: 
					plant_image.texture = load("res://assets/plots/plotBlue_stage2.png")
				4: 
					plant_image.texture = load("res://assets/plots/plotBlue_stage2.png")
		"red1":
			match seedGrowthState:
				1: 
					plant_image.texture = load("res://assets/plots/plotRed_stage1.png")
				2: 
					plant_image.texture = load("res://assets/plots/plotRed_stage2.png")
				3: 
					plant_image.texture = load("res://assets/plots/plotRed_stage2.png")
				4: 
					plant_image.texture = load("res://assets/plots/plotRed_stage2.png")
		"orange1":
			match seedGrowthState:
				1: 
					plant_image.texture = load("res://assets/plots/plotOrange_stage1.png")
				2: 
					plant_image.texture = load("res://assets/plots/plotOrange_stage2.png")
				3: 
					plant_image.texture = load("res://assets/plots/plotOrange_stage2.png")
				4: 
					plant_image.texture = load("res://assets/plots/plotOrange_stage2.png")
		"white1":
			match seedGrowthState:
				1: 
					plant_image.texture = load("res://assets/plots/plotWhite_stage1.png")
				2: 
					plant_image.texture = load("res://assets/plots/plotWhite_stage2.png")
				3: 
					plant_image.texture = load("res://assets/plots/plotWhite_stage2.png")
				4: 
					plant_image.texture = load("res://assets/plots/plotWhite_stage2.png")

	# Set seedGrowthState by water level
	if fillBar.value >= 33 && fillBar.value < 66:
		seedGrowthState = 2
		particles.visible = true
	if fillBar.value >= 66 && fillBar.value < 100:
		seedGrowthState = 3
	if fillBar.value == 100:
		seedGrowthState = 4
	else:
		seedGrowthState = 1
	
	if fillBar.value < 100:
		fillBar.value -= 0.07
	if fillBar.value == 100:
		water_button.disabled = true
		water_button.text = "GROWN!"

func _input(event):
	if event.is_action_pressed("ui_cancel") && self.visible:
		UiManager.toggle_ui(self, false)
	
func load_plant(plotNode: Node2D, seedSent: String, growthState: int):
	currentPlot = plotNode
	seedGrowthState = growthState
	plantedSeed = seedSent
	if plantedSeed == "blue1":
		plant_image.texture = load("res://assets/plots/plotBlue_stage1.png")
	if plantedSeed == "red1":
		plant_image.texture = load("res://assets/plots/plotRed_stage1.png")
	if plantedSeed == "orange1":
		plant_image.texture = load("res://assets/plots/plotOrange_stage1.png")
	if plantedSeed == "white1":
		plant_image.texture = load("res://assets/plots/plotWhite_stage1.png")
	
func _on_ui_open():
	fillBar.value = 0
	#seedGrowthState = 0
	particles.visible = false #DEBUG
	water_button.disabled = false
	water_button.text = "WATER"
	
func _on_ui_close():
	currentPlot.update_plot(seedGrowthState)
	
func _on_water_button_pressed():
	fillBar.value += 4
	audio_player.play()
	if UiManager.dev_debug_mode:
		fillBar.value = 100

func _on_close_button_pressed():
	#Input.action_press("ui_cancel")
	UiManager.toggle_ui(self, false)
