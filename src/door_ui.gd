extends CanvasLayer

@onready var essenceBlue = $MarginContainer/PanelContainer/HBoxContainer/DoorPanel/VBoxContainer1/HBoxContainer/VBoxContainerLeft/HBoxContainerBlue/textBox1/countBlue
@onready var essenceRed = $MarginContainer/PanelContainer/HBoxContainer/DoorPanel/VBoxContainer1/HBoxContainer/VBoxContainerLeft/HBoxContainerRed/textBox1/countRed
@onready var essenceOrange = $MarginContainer/PanelContainer/HBoxContainer/DoorPanel/VBoxContainer1/HBoxContainer/VBoxContainerRight/HBoxContainerOrange/textBox1/countOrange
@onready var essenceWhite = $MarginContainer/PanelContainer/HBoxContainer/DoorPanel/VBoxContainer1/HBoxContainer/VBoxContainerRight/HBoxContainerOrange2/textBox1/countWhite

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass
	#essenceBlue.text = str(DockController.essenceBlue)
	#essenceRed.text = str(DockController.essenceRed)
	#essenceOrange.text = str(DockController.essenceOrange)
	#essenceWhite.text = str(DockController.essenceWhite)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel") && self.visible:
		UiManager.toggle_ui(self, false)

func _on_ui_open():
	essenceBlue.text = str(DockController.essenceBlue)
	essenceRed.text = str(DockController.essenceRed)
	essenceOrange.text = str(DockController.essenceOrange)
	essenceWhite.text = str(DockController.essenceWhite)

func _on_ui_close():
	#audio_player.play()
	pass

func _on_close_button_pressed():
	#Input.action_press("ui_cancel")
	UiManager.toggle_ui(self, false)
