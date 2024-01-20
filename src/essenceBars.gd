extends Control

@onready var countBlue = get_tree().get_first_node_in_group("essenceBlue")
@onready var countRed = get_tree().get_first_node_in_group("essenceRed")
@onready var countOrange = get_tree().get_first_node_in_group("essenceOrange")
@onready var countWhite = get_tree().get_first_node_in_group("essenceWhite")
@onready var update_timer = $update_timer

var current_countBlue = 0
var current_countRed = 0
var current_countOrange = 0
var current_countWhite = 0

var update_speed = 0.01  # Time between updates in seconds
var increment = 1  # count increment per update


# Called when the node enters the scene tree for the first time.
func _ready():
	countBlue.text = str(current_countBlue)
	countRed.text = str(current_countRed)
	countOrange.text = str(current_countOrange)
	countWhite.text = str(current_countWhite)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	#countBlue.text = DockController.essenceBank_Blue
	#countRed.text = DockController.essenceBank_Red
	#countOrange.text = DockController.essenceBank_Orange
	#countWhite.text = DockController.essenceBank_White

func update_essence(color):
	var target_count = 0
	var target
	match color:
		"blue1", "blue2", "blue":
			target = DockController.essenceBank_Blue
			target_count += target
			while current_countBlue < target_count:
				if increment < (target_count - current_countBlue) / 200:
					increment += (target_count - current_countBlue) / 500
				else:
					increment = 1
				current_countBlue += increment
				countBlue.text = str(current_countBlue)
				update_timer.start(update_speed)
				await update_timer.timeout
			countBlue.text = str(DockController.essenceBank_Blue)
			current_countBlue = DockController.essenceBank_Blue
			
		"red1", "red2", "red":
			target = DockController.essenceBank_Red
			target_count += target
			while current_countRed < target_count:
				current_countRed += increment
				countRed.text = str(current_countRed)
				update_timer.start(update_speed)
				await update_timer.timeout
			countRed.text = str(DockController.essenceBank_Red)
			current_countRed = DockController.essenceBank_Red
			
		"orange1", "orange2", "orange":
			target = DockController.essenceBank_Orange
			target_count += target
			while current_countOrange < target_count:
				current_countOrange += increment
				countOrange.text = str(current_countOrange)
				update_timer.start(update_speed)
				await update_timer.timeout
			countOrange.text = str(DockController.essenceBank_Orange)
			current_countOrange = DockController.essenceBank_Orange
			
		"white1", "white2", "white":
			target = DockController.essenceBank_White
			target_count += target
			while current_countWhite < target_count:
				current_countWhite += increment
				countWhite.text = str(current_countWhite)
				update_timer.start(update_speed)
				await update_timer.timeout
			countWhite.text = str(DockController.essenceBank_White)
			current_countWhite = DockController.essenceBank_White
			
	#
	#str(DockController.essenceBlue)
	#target_count += target 
	#
	#str(DockController.essenceRed)
	#target_count += target 
	#
	#str(DockController.essenceOrange)
	#target_count += target 
	#
	#str(DockController.essenceWhite)

