extends CanvasLayer

@onready var audio_player = $AudioStreamPlayer
@onready var pause_sound = preload("res://assets/sounds/Click_Mouse.wav")
@onready var button_press = preload("res://assets/sounds/Click (21).wav")
@onready var windowModeButton = $MarginContainer/PanelContainer/pausePanel/VBoxContainer1/HBoxContainer/VBoxContainer/HBoxContainer/WindowModeButton
@onready var resolutionButton = $MarginContainer/PanelContainer/pausePanel/VBoxContainer1/HBoxContainer/VBoxContainer/HBoxContainer2/ResolutionButton

var window_modes: Dictionary = {
	"Fullscreen":DisplayServer.WINDOW_MODE_FULLSCREEN,
	"Window":DisplayServer.WINDOW_MODE_WINDOWED,
	"Window Maximized":DisplayServer.WINDOW_MODE_MAXIMIZED
}

var resolutions: Dictionary = {
	"320 x 180": Vector2i(320, 180),
	"480 x 270": Vector2i(480, 270),
	"640 x 360": Vector2i(640, 360),
	"854 x 480": Vector2i(854, 480),
	"1280 x 720": Vector2i(1280, 720),
	"1920 x 1080": Vector2i(1920, 1080)
}

# Called when the node enters the scene tree for the first time.
func _ready():
	for window_mode in window_modes:
		windowModeButton.add_item(window_mode)
	for resolution in resolutions:
		resolutionButton.add_item(resolution)
	
	UiManager.menu_active = true
	audio_player.stream = button_press
	initialize_control()
	_on_ui_open()

func _input(event):
	if event.is_action_pressed("ui_cancel") && get_tree().paused:
		_on_ui_close()

func _on_ui_open():
	await audio_player.finished

func _on_ui_close():
	audio_player.play()
	queue_free()

func initialize_control():
	SettingsManager.load_settings()
	var settings_date: SettingsDataResource = SettingsManager.get_settings()
	windowModeButton.selected = settings_date.window_mode_index
	resolutionButton.selected = settings_date.resolution_index

func _on_close_button_pressed():
	_on_ui_close()


func _on_window_mode_button_item_selected(index):
	audio_player.play()
	var window_mode = window_modes.get(windowModeButton.get_item_text(index)) as int
	SettingsManager.set_window_mode(window_mode, index)

func _on_resolution_button_item_selected(index):
	audio_player.play()
	var resolution = resolutions.get(resolutionButton.get_item_text(index)) as Vector2i
	SettingsManager.set_resolution(resolution, index)


func _on_back_button_pressed():
	SettingsManager.save_settings()
	_on_ui_close()
