extends Control

#@onready var essenceBlue = get_tree().get_first_node_in_group("essenceBlue")
#@onready var essenceRed = get_tree().get_first_node_in_group("essenceRed")
#@onready var essenceOrange = get_tree().get_first_node_in_group("essenceOrange")
#@onready var essenceWhite = get_tree().get_first_node_in_group("essenceWhite")
@onready var essenceBlue: int
@onready var essenceRed: int
@onready var essenceOrange: int
@onready var essenceWhite: int
#@onready var book = get_tree().get_first_node_in_group("book_UI")

# Called when the node enters the scene tree for the first time.
func _ready():
#	essence.add_essence.connect(_on_essence_add)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func essenceAdd(essenceColor: String, multiplier: int):
	var newEssence: int
	match essenceColor:
		"blue1":
			var currentEssence = essenceBlue
			newEssence = currentEssence + (1 * multiplier)
			essenceBlue = newEssence
		"blue2":
			var currentEssence = essenceBlue
			newEssence = currentEssence + (1 * multiplier)
			essenceBlue = newEssence
		"red1":
			var currentEssence = essenceRed
			newEssence = currentEssence + (1 * multiplier)
			essenceRed = newEssence
		"red2":
			var currentEssence = essenceRed
			newEssence = currentEssence + (1 * multiplier)
			essenceRed = newEssence
		"orange1":
			var currentEssence = essenceOrange
			newEssence = currentEssence + (1 * multiplier)
			essenceOrange = newEssence
		"orange2":
			var currentEssence = essenceOrange
			newEssence = currentEssence + (1 * multiplier)
			essenceOrange = newEssence
		"white1":
			var currentEssence = essenceWhite
			newEssence = currentEssence + (1 * multiplier)
			essenceWhite = newEssence
		"white2":
			var currentEssence = essenceWhite
			newEssence = currentEssence + (1 * multiplier)
			essenceWhite = newEssence
	
