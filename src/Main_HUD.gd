extends CanvasLayer

@onready var countBlue = get_tree().get_first_node_in_group("essenceBlue")
@onready var countRed = get_tree().get_first_node_in_group("essenceRed")
@onready var countOrange = get_tree().get_first_node_in_group("essenceOrange")
@onready var countWhite = get_tree().get_first_node_in_group("essenceWhite")
@onready var book = get_tree().get_first_node_in_group("book_UI")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	countBlue.text = str(DockController.essenceBlue) # May look for a way to render this as counting up fast
	countRed.text = str(DockController.essenceRed) # May look for a way to render this as counting up fast
	countOrange.text = str(DockController.essenceOrange) # May look for a way to render this as counting up fast
	countWhite.text = str(DockController.essenceWhite) # May look for a way to render this as counting up fast

func _on_book_button_pressed():
	UiManager.toggle_ui(book, true)

