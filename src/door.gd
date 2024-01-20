extends StaticBody2D

#@onready var door_UI = get_tree().get_first_node_in_group("door_UI")
@onready var interaction_area = $InteractionArea
@onready var speech_sound = preload("res://assets/sounds/UI_Menu_04.wav")
@onready var spoken = DialogManager.door_spoken

@export_category("Current Room Number")
@export var room: int
var door_type
var door_ui

var door_interact: bool = true:
	set(status):
		if !status:
			open_door()

const lines: Array[String] = [
	"Dang, this thing is big!",
	"I wonder how it opens?"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	door_ui = get_tree().get_first_node_in_group("door_UI")
	if $Sprite2D.texture == load("res://assets/door1_left.png"):
		door_type = "left"
	elif $Sprite2D.texture == load("res://assets/door1_right.png"):
		door_type = "right"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_interact(): 
	if door_interact:
		if !DialogManager.door_spoken:
			DialogManager.start_dialog(lines, speech_sound)
			await DialogManager.dialog_finished
			DialogManager.door_spoken = true
			if door_ui == null:
				UiManager.load_ui("door_ui")
	# Maybe play a buzzing or thump sound here?
		UiManager.toggle_ui(door_ui, true)
	elif !door_interact:
		return

func open_door():
	print("Opening Door")
	if door_type == "left":
		$Sprite2D.texture = load("res://assets/door1_left.png") # Need a 'door1_open_left' here
	elif door_type == "right":
		$Sprite2D.texture = load("res://assets/door1_right.png") # Need a 'door1_open_right' here
	
	$CollisionPolygon2D.queue_free()

func _on_door_transition_area_body_entered(body):
	if room == 0:
		SceneManager.transition_to_scene("Room_1")
	if room == 1:
		SceneManager.transition_to_scene("Room_2")
	if room == 2:
		SceneManager.transition_to_scene("Debug")
