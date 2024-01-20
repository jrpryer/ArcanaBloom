extends CanvasLayer

var options_ui = preload("res://ui/scenes/options_menu_ui.tscn")
@onready var audio_player = $AudioStreamPlayer
@onready var button_press = preload("res://assets/sounds/Click (21).wav")

func _ready():
	UiManager.menu_active = true
	audio_player.stream = button_press

func _on_play_button_pressed():
	UiManager.menu_active = false
	GameManager.start_game()
	queue_free()
 
func _on_exit_button_pressed():
	audio_player.play()
	await audio_player.finished
	GameManager.exit_game()


func _on_options_button_pressed():
	audio_player.play()
	var options_ui_screen = options_ui.instantiate()
	get_tree().get_root().add_child(options_ui_screen)

func _on_debug_button_pressed():
	UiManager.menu_active = false #DEBUG
	GameManager.start_debug() #DEBUG
	queue_free() #DEBUG
