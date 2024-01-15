extends CanvasLayer

@onready var fillBar = get_tree().get_first_node_in_group("waterFill")
@onready var plant = get_tree().get_first_node_in_group("plant")
@onready var particles = get_tree().get_first_node_in_group("particles")
@onready var watering_sound = preload("res://assets/sounds/Splash Small 2_2.wav")

@onready var audio_player = $AudioStreamPlayer

var plantedSeed: String
var seedGrowthState: int
#var seedGrowthState: int:
	#set(value):
		#print(value)
		#var particle_timer = get_tree().create_timer(1.0)
		#particles.visible = true
		#await particle_timer.timeout
		#particles.visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	audio_player.stream = watering_sound
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		UiManager.toggle_ui(self, false, "water_ui")

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
	
	
	# Modulate texture as plant grows/shrinks
	match plantedSeed:
		"blue1":
			match seedGrowthState:
				1: 
					plant.texture = load("res://assets/plots/plotBlue_stage1.png")
		"red1":
			match seedGrowthState:
				1: 
					plant.texture = load("res://assets/plots/plotRed_stage1.png")
		"orange1":
			match seedGrowthState:
				1: 
					plant.texture = load("res://assets/plots/plotOrange_stage1.png")
		"white1":
			match seedGrowthState:
				1: 
					plant.texture = load("res://assets/plots/plotWhite_stage1.png")


#### DEBUG
	#if Input.is_action_pressed("DEBUG_testWater"):
		##self.visible = true
		##UiManager.menu_active = true
		#UiManager.toggle_ui(self, true, "water_ui")
#### DEBUG
	
	if fillBar.value < 100:
		fillBar.value -= 0.07
	else:
		return
	
func load_plant(seedSent: String, growthState: int):
	seedGrowthState = growthState
	plantedSeed = seedSent
	if plantedSeed == "blue1":
		plant.texture = load("res://assets/plots/plotBlue_stage1.png")
	if plantedSeed == "red1":
		plant.texture = load("res://assets/plots/plotRed_stage1.png")
	if plantedSeed == "orange1":
		plant.texture = load("res://assets/plots/plotOrange_stage1.png")
	if plantedSeed == "white1":
		plant.texture = load("res://assets/plots/plotWhite_stage1.png")
	
func ui_open():
	fillBar.value = 0
	particles.visible = false #DEBUG
	
func _on_water_button_pressed():
	fillBar.value += 4
	audio_player.play()
	

func _on_close_button_pressed():
	#Input.action_press("ui_cancel")
	self.visible = false
	UiManager.menu_active = false
