extends StaticBody2D
class_name Plantable

@onready var seedCount = get_tree().get_first_node_in_group("seedsBar").seedCount
@onready var water_ui = get_tree().get_first_node_in_group("water_UI")
@onready var plant_ui = get_tree().get_first_node_in_group("plant_UI")

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var plant = $plant_stalk
@onready var audio_player = $AudioStreamPlayer
@onready var spoken = DialogManager.plot_spoken

@onready var speech_sound = preload("res://assets/sounds/UI_Menu_04.wav")
@onready var progression_sound = preload("res://assets/sounds/AC_Correct_Answer_01v2.wav")
@onready var plant_sound = preload("res://assets/sounds/Chest Close 3.wav")

@onready var plantedSeed: String = "empty"

var seed_interact = false
var plot_interact = false
var plant_interact = false
var seedGrowthState: int



const lines: Array[String] = [
	"Now to water it!"
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _process(_delta):
	if SeedsBar.seedBank.size() > 0 && plantedSeed == "empty":
		seed_interact = true
		$InteractionArea.can_interact = true
	elif plantedSeed != "empty" && seedGrowthState < 4:
		seed_interact = false
		plot_interact = true
		$InteractionArea.action_name = "Water"
		$InteractionArea.can_interact = true
	elif plantedSeed != "empty" && seedGrowthState == 4:
		seed_interact = false
		plot_interact = false
		plant_interact = true
		$InteractionArea.action_name = "Inspect"
		$InteractionArea.can_interact = true
	else:
		seed_interact = false
		$InteractionArea.can_interact = false
		InteractionManager.unregister_area($InteractionArea)
	
func _on_interact():
	if plantedSeed == "empty" && seed_interact:
		plantedSeed = SeedsBar.seedBank.front()
	# Remove Seed from hotbar.
		SeedsBar.unregister_seed(plantedSeed)
	# Play plant_sound
		audio_player.stream = plant_sound
		var new_audio_player = audio_player.duplicate()
		get_tree().root.add_child(new_audio_player)
		new_audio_player.play()
		#await new_audio_player.finished #?? Need?
		#new_audio_player.queue_free() #?? Need?
	# Give little message
		if !DialogManager.plot_spoken:
			DialogManager.start_dialog(lines, speech_sound)
			DialogManager.plot_spoken = true
			#await DialogManager.dialog_finished

	if plantedSeed != "empty" && seed_interact:
		if plantedSeed == "blue1":
			plant.texture = load("res://assets/plots/plotBlue_stage1.png")
			seedGrowthState = 1
		elif plantedSeed == "red1":
			plant.texture = load("res://assets/plots/plotRed_stage1.png")
			seedGrowthState = 1
		elif plantedSeed == "orange1":
			plant.texture = load("res://assets/plots/plotOrange_stage1.png")
			seedGrowthState = 1
		elif plantedSeed == "white1":
			plant.texture = load("res://assets/plots/plotWhite_stage1.png")
			seedGrowthState = 1
	
	#if plot_interact == true && seedGrowthState == 1: #?? Need?
	if plot_interact == true:
		water_ui.load_plant(self, plantedSeed, seedGrowthState)
		UiManager.toggle_ui(water_ui, true)
		
# Opening the plant_ui
	if plant_interact == true:
		plant_ui.load_plant(plantedSeed)
		UiManager.toggle_ui(plant_ui, true)

func update_plot(newGrowthState: int):
	seedGrowthState = newGrowthState
	match plantedSeed:
		"blue1":
			match seedGrowthState:
				1: 
					plant.texture = load("res://assets/plots/plotBlue_stage1.png")
				2: 
					plant.texture = load("res://assets/plots/plotBlue_stage2.png")
				3: 
					plant.texture = load("res://assets/plots/plotBlue_stage2.png")
				4: 
					plant.texture = load("res://assets/plots/plotBlue_stage2.png")
		"red1":
			match seedGrowthState:
				1: 
					plant.texture = load("res://assets/plots/plotRed_stage1.png")
				2: 
					plant.texture = load("res://assets/plots/plotRed_stage2.png")
				3: 
					plant.texture = load("res://assets/plots/plotRed_stage2.png")
				4: 
					plant.texture = load("res://assets/plots/plotRed_stage2.png")
		"orange1":
			match seedGrowthState:
				1: 
					plant.texture = load("res://assets/plots/plotOrange_stage1.png")
				2: 
					plant.texture = load("res://assets/plots/plotOrange_stage2.png")
				3: 
					plant.texture = load("res://assets/plots/plotOrange_stage2.png")
				4: 
					plant.texture = load("res://assets/plots/plotOrange_stage2.png")
		"white1":
			match seedGrowthState:
				1: 
					plant.texture = load("res://assets/plots/plotWhite_stage1.png")
				2: 
					plant.texture = load("res://assets/plots/plotWhite_stage2.png")
				3: 
					plant.texture = load("res://assets/plots/plotWhite_stage2.png")
				4: 
					plant.texture = load("res://assets/plots/plotWhite_stage2.png")
