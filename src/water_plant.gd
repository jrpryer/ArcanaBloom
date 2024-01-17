extends CanvasLayer

@onready var plant_ui = get_tree().get_first_node_in_group("plant_UI")
@onready var water_fill = $MarginContainer/Panel/BoxContainer/VBoxContainer/HBoxContainer2/waterFill
@onready var plant_image = $MarginContainer/Panel/plant_window/plant
@onready var particles = $MarginContainer/Panel/plant_window/VBoxContainer/particles
@onready var water_button = $MarginContainer/Panel/BoxContainer/VBoxContainer/HBoxContainer/water_button
@onready var watering_sound = preload("res://assets/sounds/Splash Small 2_2.wav")

@onready var audio_player = $AudioStreamPlayer

@onready var currentPlot: Node2D
@onready var plantedSeed: String
@onready var seedGrowthState: int

var water_full: bool:
	set(status):
		if status:
			end_watering()

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


	if water_fill.value < 100:
		water_fill.value -= 0.07
		
# Set seedGrowthState by water level
	if water_fill.value >= 33 && water_fill.value < 66:
		seedGrowthState = 2
		particles.visible = true
	if water_fill.value >= 66 && water_fill.value < 100:
		seedGrowthState = 3
	if water_fill.value == 100:
		seedGrowthState = 4
		water_full = true
	else:
		seedGrowthState = 1

func _input(event):
	if event.is_action_pressed("ui_cancel") && self.visible:
		UiManager.toggle_ui(self, false)
	else:
		return
	
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

func end_watering():
	if seedGrowthState == 4:
		currentPlot.update_plot(seedGrowthState)
		water_button.disabled = true
		water_button.text = "GROWN!"
		await get_tree().create_timer(1.0).timeout
		UiManager.toggle_ui(self, false)
		plant_ui.load_plant(plantedSeed)
		UiManager.toggle_ui(plant_ui, true)
		seedGrowthState = 1
	else:
		return
	
func _on_ui_open():
		particles.visible = false #DEBUG
		water_button.disabled = false
		water_button.text = "WATER"
	
func _on_ui_close():
	water_fill.value = 0
	
func _on_water_button_pressed():
	water_fill.value += 4
	audio_player.play()
	if UiManager.dev_debug_mode:
		water_fill.value = 100

func _on_close_button_pressed():
	UiManager.toggle_ui(self, false)
