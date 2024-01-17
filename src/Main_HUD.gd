extends CanvasLayer

@onready var book = get_tree().get_first_node_in_group("book_UI")


func _on_book_button_pressed():
	UiManager.toggle_ui(book, true)
