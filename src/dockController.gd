extends Control

#@onready var essenceBlue = get_tree().get_first_node_in_group("essenceBlue")
#@onready var essenceRed = get_tree().get_first_node_in_group("essenceRed")
#@onready var essenceOrange = get_tree().get_first_node_in_group("essenceOrange")
#@onready var essenceWhite = get_tree().get_first_node_in_group("essenceWhite")
@onready var essenceBank_Blue: int
@onready var essenceBank_Red: int
@onready var essenceBank_Orange: int
@onready var essenceBank_White: int
@onready var essence_bar

func connect_new_scene():
	essence_bar = get_tree().get_first_node_in_group("essenceBars")

func essenceAdd(essenceColor: String, multiplier: int):
	var newEssence: int
	match essenceColor:
		"blue1", "blue2":
			var currentEssence = essenceBank_Blue
			newEssence = currentEssence + (1 * multiplier)
			essenceBank_Blue = newEssence
		"red1", "red2":
			var currentEssence = essenceBank_Red
			newEssence = currentEssence + (1 * multiplier)
			essenceBank_Red = newEssence
		"orange1", "orange2":
			var currentEssence = essenceBank_Orange
			newEssence = currentEssence + (1 * multiplier)
			essenceBank_Orange = newEssence
		"white1", "white2":
			var currentEssence = essenceBank_White
			newEssence = currentEssence + (1 * multiplier)
			essenceBank_White = newEssence
	essence_bar.update_essence(essenceColor)
	
