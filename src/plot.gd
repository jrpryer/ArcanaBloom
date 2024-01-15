extends StaticBody2D
class_name Plantable

@onready var water_ui = get_tree().get_first_node_in_group("waterUI")
@onready var seedCount = get_tree().get_first_node_in_group("seedsBar").seedCount
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite = $plant_stalk
@onready var audio_player = $AudioStreamPlayer

@onready var speech_sound = preload("res://assets/sounds/UI_Menu_04.wav")
@onready var progression_sound = preload("res://assets/sounds/AC_Correct_Answer_01v2.wav")
@onready var plant_sound = preload("res://assets/sounds/Chest Close 3.wav")

@onready var plantedSeed: String = "empty"

var seed_interact = false
var plot_interact = false
#var plotSeed: Array[InventoryItem_seed]
var seedGrowthState: int


const lines: Array[String] = [
	"Now grow!"
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	#self.check_plant = Callable(self, "_on_check_plant")
	
func _process(_delta):
	if SeedsBar.seedBank.size() > 0 && plantedSeed == "empty":
		seed_interact = true
		$InteractionArea.can_interact = true
	elif plantedSeed != "empty":
		seed_interact = false
		plot_interact = true
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
		#subtract_seed.emit()
		
		# Play plant_sound
		audio_player.stream = plant_sound
		var new_audio_player = audio_player.duplicate()
		get_tree().root.add_child(new_audio_player)
		new_audio_player.play()
		#await new_audio_player.finished
		#new_audio_player.queue_free()
		
		# Give little message
		DialogManager.start_dialog(lines, speech_sound)
		#await DialogManager.dialog_finished

	if plantedSeed != "empty" && seed_interact:
		if plantedSeed == "blue1":
			sprite.texture = load("res://assets/plots/plotBlue_stage1.png")
			seedGrowthState = 1
		elif plantedSeed == "red1":
			sprite.texture = load("res://assets/plots/plotRed_stage1.png")
			seedGrowthState = 1
		elif plantedSeed == "orange1":
			sprite.texture = load("res://assets/plots/plotOrange_stage1.png")
			seedGrowthState = 1
		elif plantedSeed == "white1":
			sprite.texture = load("res://assets/plots/plotWhite_stage1.png")
			seedGrowthState = 1
	
	if plot_interact == true && seedGrowthState == 1:
		water_ui.load_plant(plantedSeed, seedGrowthState)
		UiManager.toggle_ui(water_ui, true, "water_ui")

func _on_check_plant():
	return plantedSeed
