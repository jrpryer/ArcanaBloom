extends Control

@onready var seedUI = get_tree().get_first_node_in_group("seedUI")
@onready var seedCount: int = 0

#var seedBank: Array[InventoryItem_seed]
var seedBank: Array[String]

#func register_seed(seedID: InventoryItem_seed):
func register_seed(seedName: String):
	#seedBank.push_back(seedID)
	seedBank.push_back(seedName)
	seedCount = seedBank.size()
	seedUI.text = str(seedCount)

#func unregister_seed(seedID: InventoryItem_seed):
func unregister_seed(seedName: String):
	var deleteSeed = seedBank.find(seedName)
	if deleteSeed != -1:
		seedBank.pop_at(deleteSeed)
		seedCount = seedBank.size()
		seedUI.text = str(seedCount)


# Called when the node enters the scene tree for the first time.
func _ready():
	#plot1.subtract_seed.connect(_on_seed_subtract)
	pass

func _process(_delta):
	pass

#func _on_seed_subtract():
	#seedBank.pop_at((seedBank.size() -1))
	#seedCount = seedBank.size()
