extends StaticBody2D

@onready var seedsCount = int(get_tree().get_first_node_in_group("seedsBar").text)
@onready var interaction_area: InteractionArea = $InteractionArea
#@onready var sprite = $Sprite2D
@onready var audio_player = $AudioStreamPlayer

@onready var speech_sound = preload("res://assets/sounds/UI_Menu_04.wav")
@onready var progression_sound = preload("res://assets/sounds/AC_Correct_Answer_01v2.wav")
@onready var plant_sound = preload("res://assets/sounds/Chest Close 3.wav")

var can_interact = false
#var plotSeed: Array[InventoryItem_seed]
var plantedSeed: String = "empty"
var seedGrowthState: int


const lines: Array[String] = [
	"Grow little one!"
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _process(_delta):
	if SeedsBar.seedBank.size() > 0:
		can_interact = true
		$InteractionArea.can_interact = true
	else:
		can_interact = false
		$InteractionArea.can_interact = false
		InteractionManager.unregister_area($InteractionArea)
	
func _on_interact():
	if plantedSeed == "empty" && can_interact:
		plantedSeed = SeedsBar.seedBank[0]
		# Remove Seed from hotbar.
		SeedsBar.unregister_seed(plantedSeed[0])
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

	if plantedSeed != "empty" && can_interact:
		if plantedSeed[0] == "blue1":
			$Sprite2D.texture = load("res://assets/plots/plotBlue_stage1.png")
			seedGrowthState = 1
			print(plantedSeed[0]) #DEBUG
