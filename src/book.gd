extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	UiManager.toggle_ui(self, false, "book")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		UiManager.toggle_ui(self, false, "book")

func _on_close_button_pressed():
	#Input.action_press("ui_cancel")
	UiManager.toggle_ui(self, false, "book")
