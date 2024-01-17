extends Node

#@onready var text_popup_scene = preload("res://ui/text_popup.tscn")
#@onready var text_popup_scene = preload("res://ui/textFeed.tscn")
@onready var textFeed_scene = get_tree().get_first_node_in_group("textFeed")
@onready var textFeed = get_tree().get_first_node_in_group("textFeedDock")
@onready var audio_player = get_tree().get_first_node_in_group("sfx")
@onready var advance_sound = preload("res://assets/sounds/Click_Mouse.wav")

var seed_spoken = false
var plot_spoken = false
var door_spoken = false

func _ready():
	textFeed_scene.finished_displaying.connect(_on_text_popup_finished_displaying)
	audio_player.stream = advance_sound

var dialog_lines: Array[String] = []
var current_line_index = 0

var text_popup
var text_popup_position: Vector2
#var tail_pos: float

var sfx: AudioStream # Still need to add_child a new_audio_player and play() 

var is_dialog_active = false
var can_advance_line = false

signal dialog_finished()

func start_dialog(lines: Array[String], speech_sfx: AudioStream):
	if is_dialog_active:
		return
	
	dialog_lines = lines
#	text_popup_position = position
	text_popup_position = textFeed.global_position
	sfx = speech_sfx
	_show_popup()
	
	is_dialog_active = true

func _show_popup():
	text_popup = textFeed_scene
	text_popup.global_position = text_popup_position
	text_popup.display_text(dialog_lines[current_line_index], sfx)
	
	can_advance_line = false
	
func _on_text_popup_finished_displaying():
	can_advance_line = true

func _unhandled_input(event):
	if (
		event.is_action_pressed("advance_dialog") &&
		is_dialog_active &&
		can_advance_line
	):
		audio_player.play()
		#await audio_player.finished
		#new_audio_player.queue_free()
		
		current_line_index += 1
		if current_line_index >= dialog_lines.size():
			is_dialog_active = false
			current_line_index = 0
			dialog_finished.emit()
			text_popup.label.text = ""
			text_popup.next_indicator.visible = false
			return
			
		_show_popup()
