extends CanvasLayer

#var book = get_tree().get_first_node_in_group("book_UI")
var book
var book_ui = preload("res://ui/scenes/book_ui.tscn")


func _ready():
	DialogManager.connect_new_scene()
	SeedsBar.connect_new_scene()
	DockController.connect_new_scene()

func _on_book_button_pressed():
	if book != null:
		UiManager.toggle_ui(book, true)
	elif book == null:
		#book = book_ui.instantiate()
		#get_tree().get_root().add_child(book)
		var book_ui_screen = UiManager.load_ui("book_ui")
		book = book_ui_screen
		#book = get_tree().get_first_node_in_group("book_UI")
		UiManager.toggle_ui(book, true)


func _on_setting_button_pressed():
	GameManager.pause_game()
