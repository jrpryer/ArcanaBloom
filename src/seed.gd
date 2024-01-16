extends StaticBody2D
class_name InventoryItem_seed

@export var seedName: String = "color"
@export var seedTexture: SpriteFrames

#@onready var Seed = get_tree().get_first_node_in_group("seed")
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite = $SeedSprite
@onready var audio_player = $AudioStreamPlayer

@onready var speech_sound = preload("res://assets/sounds/UI_Menu_04.wav")
@onready var progression_sound = preload("res://assets/sounds/AC_Correct_Answer_01v2.wav")
@onready var pickup_sound = preload("res://assets/sounds/Bag 04.wav")

var spoken = DialogManager.seed_spoken

#@onready var lines1: Array[String] = [
	#"A new seed!"
	##seedName #DEBUG
#]

const lines1: Array[String] = [
	"A magic seed!",
	"I should plant it.",
	"You know, just to be sure."
]

const lines2: Array[String] = [
	"A new seed!"
]

func _ready():
	sprite.sprite_frames = seedTexture
	sprite.play("animate")
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	if !spoken:
		DialogManager.start_dialog(lines1, speech_sound)
		await DialogManager.dialog_finished
		DialogManager.seed_spoken = true
		print("has spoken?" + str(DialogManager.seed_spoken))
	elif spoken:
		DialogManager.start_dialog(lines2, speech_sound)
		await DialogManager.dialog_finished
	queue_free()
	
# Add Seed to hotbar	
	SeedsBar.register_seed(seedName)

	audio_player.stream = pickup_sound
	audio_player.play()
