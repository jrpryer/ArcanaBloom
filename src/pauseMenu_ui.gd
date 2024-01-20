extends CanvasLayer

@onready var audio_player = $AudioStreamPlayer
@onready var pause_sound_open = preload("res://assets/sounds/Click_Mouse.wav")
@onready var button_press = preload("res://assets/sounds/Click (21).wav")
var options_ui = preload("res://ui/scenes/options_menu_ui.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	#UiManager.toggle_ui(self, false)
	UiManager.menu_active = true
	audio_player.stream = pause_sound_open
	#_on_ui_open()
	audio_player.play()
	await audio_player.finished
	audio_player.stream = button_press

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
	#pass

func _input(event):
	if event.is_action_pressed("ui_cancel") && get_tree().paused:
		#UiManager.toggle_ui(self, false)
		_on_ui_close()

#func _on_ui_open():
	#audio_player.play()
	#await audio_player.finished
	#audio_player.stream = button_press

func _on_ui_close():
	audio_player.play()
	#await audio_player.finished
	GameManager.unpause_game()
	queue_free()

func _on_close_button_pressed():
	audio_player.play()
	_on_ui_close()

func _on_continue_button_pressed():
	audio_player.play()
	GameManager.unpause_game()
	queue_free()

func _on_options_button_pressed():
	audio_player.play()
	var options_ui_screen = options_ui.instantiate()
	get_tree().get_root().add_child(options_ui_screen)

func _on_menu_button_pressed():
	audio_player.play()
	GameManager.main_menu()
	queue_free()
