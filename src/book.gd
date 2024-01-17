extends CanvasLayer

@onready var audio_player = $AudioStreamPlayer
#@onready var new_audio_player = audio_player.duplicate()
@onready var book_sound_open = preload("res://assets/sounds/Book 04.wav")
@onready var book_sound_close = preload("res://assets/sounds/Book 08.wav")
@onready var door_ui = get_tree().get_first_node_in_group("door_UI")


# Called when the node enters the scene tree for the first time.
func _ready():
	UiManager.toggle_ui(self, false)
	audio_player.stream = book_sound_open

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel") && self.visible:
		UiManager.toggle_ui(self, false)

func _on_ui_open():
	audio_player.play()

func _on_ui_close():
	audio_player.stream = book_sound_close
	audio_player.play()


func _on_close_button_pressed():
	#Input.action_press("ui_cancel")
	UiManager.toggle_ui(self, false)

func _on_water_button_toggled(toggled_on):
	if toggled_on:
		UiManager.dev_debug_mode = true
	if !toggled_on:
		UiManager.dev_debug_mode = false

func _on_seed_button_pressed():
	SeedsBar.register_seed("white1")

func _on_essence_button_pressed():
	DockController.essenceAdd("blue1", 1501)

func _on_dialogue_button_toggled(toggled_on):
	var saved_state_seed = DialogManager.seed_spoken
	var saved_state_plot = DialogManager.plot_spoken
	var saved_state_door = DialogManager.door_spoken
	if toggled_on:
		DialogManager.seed_spoken = true 
		DialogManager.plot_spoken = true 
		DialogManager.door_spoken = true
		$MarginContainer/PanelContainer/HBoxContainer/journalPanel/VBoxContainer1/HBoxContainer2/dialogue_button.text = "Dialogue: OFF"
	if !toggled_on:
		DialogManager.seed_spoken = saved_state_seed
		DialogManager.plot_spoken = saved_state_plot
		DialogManager.door_spoken = saved_state_door
		$MarginContainer/PanelContainer/HBoxContainer/journalPanel/VBoxContainer1/HBoxContainer2/dialogue_button.text = "Dialogue: ON"

func _on_door_lock_pressed():
	door_ui.essence_needed = 200

func _on_door_unlock_pressed():
	door_ui.essence_needed = 1
