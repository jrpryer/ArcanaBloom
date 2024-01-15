extends Control

#@onready var essence = get_tree().get_first_node_in_group("essence") # ??
@onready var book = get_tree().get_first_node_in_group("bookUI")

# Called when the node enters the scene tree for the first time.
func _ready():
#	essence.add_essence.connect(_on_essence_add)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_book_button_pressed():
	book.visible = true
	UiManager.menu_active = true
