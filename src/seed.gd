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

@onready var lines1: Array[String] = [
	"A new seed!"
	#seedName #DEBUG
]

#const lines1: Array[String] = [
##	"A new seed!",
	#seedName
#]

var add_seed: Callable = func():
	pass

#signal adding_seed()


const lines2: Array[String] = [
	"I should plant it.",
	"You know, just to be sure."
]

func _ready():
	sprite.sprite_frames = seedTexture
	sprite.play("animate")
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	DialogManager.start_dialog(lines1, speech_sound)
	await DialogManager.dialog_finished
	queue_free()
	
#	adding_seed.emit()
	#SeedsBar.register_seed(self)
	SeedsBar.register_seed(seedName)
	# Add Seed to hotbar? make it obvious we have unplanted seeds in our "inventory"
	
	# pickup sound fire
	audio_player.stream = pickup_sound
	var new_audio_player = audio_player.duplicate()
	get_tree().root.add_child(new_audio_player)
	new_audio_player.play()
	#await new_audio_player.finished
	#new_audio_player.queue_free()

	#DialogManager.start_dialog(lines2, speech_sound)
	#await DialogManager.dialog_finished
