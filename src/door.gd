extends StaticBody2D

@onready var door_UI = get_tree().get_first_node_in_group("door_UI")
@onready var interaction_area = $InteractionArea
@onready var speech_sound = preload("res://assets/sounds/UI_Menu_04.wav")
@onready var spoken = DialogManager.door_spoken

const lines: Array[String] = [
	"Dang, this thing is big!",
	"I wonder how it opens?"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_interact():
	if !spoken:
		DialogManager.start_dialog(lines, speech_sound)
		await DialogManager.dialog_finished
		#DialogManager.door_spoken = true
		spoken = true
# Maybe play a buzzing or thump sound here?
	UiManager.toggle_ui(door_UI, true)
