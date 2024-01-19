extends CanvasLayer


func _on_continue_button_pressed():
	GameManager.unpause_game()
	queue_free()

func _on_menu_button_pressed():
	GameManager.main_menu()
	queue_free()
