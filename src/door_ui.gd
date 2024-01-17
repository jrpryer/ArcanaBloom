extends CanvasLayer

@onready var essenceBlue = $MarginContainer/PanelContainer/HBoxContainer/DoorPanel/VBoxContainer1/HBoxContainer/VBoxContainerLeft/HBoxContainerBlue/textBox1/countBlue
@onready var essenceRed = $MarginContainer/PanelContainer/HBoxContainer/DoorPanel/VBoxContainer1/HBoxContainer/VBoxContainerLeft/HBoxContainerRed/textBox1/countRed
@onready var essenceOrange = $MarginContainer/PanelContainer/HBoxContainer/DoorPanel/VBoxContainer1/HBoxContainer/VBoxContainerRight/HBoxContainerOrange/textBox1/countOrange
@onready var essenceWhite = $MarginContainer/PanelContainer/HBoxContainer/DoorPanel/VBoxContainer1/HBoxContainer/VBoxContainerRight/HBoxContainerWhite/textBox1/countWhite
@onready var update_timer = $update_timer
@onready var unlockReq = $MarginContainer/PanelContainer/HBoxContainer/DoorPanel/VBoxContainer1/unlockReq

@onready var blue_button = $MarginContainer/PanelContainer/HBoxContainer/DoorPanel/VBoxContainer1/HBoxContainer/VBoxContainerLeft/blue_button
@onready var red_button = $MarginContainer/PanelContainer/HBoxContainer/DoorPanel/VBoxContainer1/HBoxContainer/VBoxContainerLeft/red_button
@onready var orange_button = $MarginContainer/PanelContainer/HBoxContainer/DoorPanel/VBoxContainer1/HBoxContainer/VBoxContainerRight/orange_button
@onready var white_button = $MarginContainer/PanelContainer/HBoxContainer/DoorPanel/VBoxContainer1/HBoxContainer/VBoxContainerRight/white_button

@onready var essence_bar = get_tree().get_first_node_in_group("essenceBars")

@onready var base_text = " to unlock"
@onready var lock_fill = $doorLock
#@onready var essence_needed: int
@onready var essence_needed = 1500
@onready var total_essence: int

var blue_button_down = false
var red_button_down = false
var orange_button_down = false
var white_button_down = false

var current_countBlue = 0
var current_countRed = 0
var current_countOrange = 0
var current_countWhite = 0

var update_speed = 0.01  # Time between updates in seconds
var increment = 1  # count increment per update

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#unlockReq.text = str(essence_needed) + base_text
	#essence_needed = 1500 #DEBUG

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	essenceBlue.text = str(current_countBlue)
	essenceRed.text = str(current_countRed)
	essenceOrange.text = str(current_countOrange)
	essenceWhite.text = str(current_countWhite)
	
	if blue_button_down && current_countBlue > 0 && essence_needed > 0:
		update_essence("blue")
		essence_needed -= increment
		total_essence -= increment
		lock_fill.value += increment
		unlockReq.text = str(essence_needed) + base_text
	if red_button_down && current_countRed > 0 && essence_needed > 0:
		update_essence("red")
		essence_needed -= increment	
		total_essence -= increment	
		lock_fill.value += increment
		unlockReq.text = str(essence_needed) + base_text
	if orange_button_down && current_countOrange > 0 && essence_needed > 0:
		update_essence("orange")
		essence_needed -= increment	
		total_essence -= increment	
		lock_fill.value += increment
		unlockReq.text = str(essence_needed) + base_text
	if white_button_down && current_countWhite > 0 && essence_needed > 0:
		update_essence("white")
		essence_needed -= increment
		total_essence -= increment
		lock_fill.value += increment
		unlockReq.text = str(essence_needed) + base_text


func _input(event):
	if event.is_action_pressed("ui_cancel") && self.visible:
		UiManager.toggle_ui(self, false)


func _on_insert_blue_button_down():
	blue_button_down = true

func _on_insert_blue_button_up():
	blue_button_down = false
	if current_countBlue == 0:
		blue_button.disabled = true

func _on_insert_red_button_down():
	red_button_down = true

func _on_insert_red_button_up():
	red_button_down = false
	if current_countRed == 0:
		red_button.disabled = true

func _on_insert_orange_button_down():
	orange_button_down = true

func _on_insert_orange_button_up():
	orange_button_down = false
	if current_countOrange == 0:
		orange_button.disabled = true

func _on_insert_white_button_down():
	white_button_down = true

func _on_insert_white_button_up():
	white_button_down = false
	if current_countWhite == 0:
		white_button.disabled = true


func update_essence(color):
	var target_count = 0
	match color:
		"blue":
			while current_countBlue > target_count && blue_button_down && essence_needed > 0:
				current_countBlue -= increment
				update_timer.start(update_speed)
				await update_timer.timeout
		"red":
			while current_countRed > target_count && red_button_down && essence_needed > 0:
				current_countRed -= increment
				update_timer.start(update_speed)
				await update_timer.timeout
		"orange":
			while current_countOrange > target_count && orange_button_down && essence_needed > 0:
				current_countOrange -= increment
				update_timer.start(update_speed)
				await update_timer.timeout
		"white":
			while current_countWhite > target_count && white_button_down && essence_needed > 0:
				current_countWhite -= increment
				update_timer.start(update_speed)
				await update_timer.timeout


func _on_ui_open():
	current_countBlue = int(DockController.essenceBank_Blue)
	if current_countBlue > 0:
		blue_button.disabled = false
	else:
		blue_button.disabled = true
	current_countRed = int(DockController.essenceBank_Red)
	if current_countRed > 0:
		red_button.disabled = false
	else:
		red_button.disabled = true
	current_countOrange = int(DockController.essenceBank_Orange)
	if current_countOrange > 0:
		orange_button.disabled = false
	else:
		orange_button.disabled = true
	current_countWhite = int(DockController.essenceBank_White)
	if current_countWhite > 0:
		white_button.disabled = false
	else:
		white_button.disabled = true
	total_essence = current_countBlue + current_countRed + current_countOrange + current_countWhite
	unlockReq.text = str(essence_needed) + base_text
	lock_fill.max_value = essence_needed

func _on_ui_close():
	#audio_player.play()
	DockController.essenceBank_Blue = current_countBlue
	DockController.essenceBank_Red = current_countRed
	DockController.essenceBank_Orange = current_countOrange
	DockController.essenceBank_White = current_countWhite
	essence_bar.update_essence("blue")
	essence_bar.update_essence("red")
	essence_bar.update_essence("orange")
	essence_bar.update_essence("white")

func _on_close_button_pressed():
	#Input.action_press("ui_cancel")
	UiManager.toggle_ui(self, false)
