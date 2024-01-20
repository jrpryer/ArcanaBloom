extends Control

#@onready var seedUI = get_tree().get_first_node_in_group("seedUI")
#@onready var seedIcon = get_tree().get_first_node_in_group("seedIcon")
@onready var seedUI
@onready var seedIcon
@onready var seedCount: int = 0
#var seedBank: Array[InventoryItem_seed]
@onready var seedBank: Array[String]

func connect_new_scene():
	seedUI = get_tree().get_first_node_in_group("seedUI")
	seedIcon = get_tree().get_first_node_in_group("seedIcon")
	
#func register_seed(seedID: InventoryItem_seed):
func register_seed(seedName: String):
	#seedBank.push_back(seedID)
	seedBank.push_back(seedName)
	seedCount = seedBank.size()
	seedUI.text = str(seedCount)
	if seedBank[0] == "blue1" || seedBank[0] == "blue2":
		seedIcon.sprite_frames = load("res://assets/seeds/seed_blue_frames.tres")
	if seedBank[0] == "red1" || seedBank[0] == "red2":
		seedIcon.sprite_frames = load("res://assets/seeds/seed_red_frames.tres")
	if seedBank[0] == "orange1" || seedBank[0] == "orange2":
		seedIcon.sprite_frames = load("res://assets/seeds/seed_orange_frames.tres")
	if seedBank[0] == "white1" || seedBank[0] == "white2":
		seedIcon.sprite_frames = load("res://assets/seeds/seed_white_frames.tres")
	seedIcon.play("animate")

#func unregister_seed(seedID: InventoryItem_seed):
func unregister_seed(seedName: String):
	var deleteSeed = seedBank.find(seedName)
	if deleteSeed != -1:
		seedBank.pop_at(deleteSeed)
		seedCount = seedBank.size()
		seedUI.text = str(seedCount)
	if seedBank.size() > 0:
		if seedBank[0] == "blue1" || seedBank[0] == "blue2":
			seedIcon.sprite_frames = load("res://assets/seeds/seed_blue_frames.tres")
		if seedBank[0] == "red1" || seedBank[0] == "red2":
			seedIcon.sprite_frames = load("res://assets/seeds/seed_red_frames.tres")
		if seedBank[0] == "orange1" || seedBank[0] == "orange2":
			seedIcon.sprite_frames = load("res://assets/seeds/seed_orange_frames.tres")
		if seedBank[0] == "white1" || seedBank[0] == "white2":
			seedIcon.sprite_frames = load("res://assets/seeds/seed_white_frames.tres")
		seedIcon.play("animate")
	elif seedBank.size() == 0:
		seedIcon.sprite_frames = load("res://assets/seeds/seed_dull_frames.tres")
		seedIcon.stop()

# Called when the node enters the scene tree for the first time.

func _process(_delta):
	pass
		

#func _on_seed_subtract():
	#seedBank.pop_at((seedBank.size() -1))
	#seedCount = seedBank.size()
