extends Control

@onready var plot1 = get_tree().get_first_node_in_group("plot") # ??


var seedCount: int = 0
#var seedBank: Array[InventoryItem_seed]
var seedBank: Array[String]

#func register_seed(seedID: InventoryItem_seed):
func register_seed(seedName: String):
	#seedBank.push_back(seedID)
	seedBank.push_back(seedName)
	seedCount = seedBank.size()

#func unregister_seed(seedID: InventoryItem_seed):
func unregister_seed(seedName: String):
	#seedBank.erase(seedName)
	var index = seedBank.find(seedName)
	print(index) #DEBUG
	if index != -1:
		seedBank.pop_at(index)


# Called when the node enters the scene tree for the first time.
func _ready():
	#plot1.subtract_seed.connect(_on_seed_subtract)
	pass

func _process(_delta):
#	seedCount = seedBank.size()
	pass

func _on_seed_subtract():
	seedBank.pop_at((seedBank.size() -1))
	seedCount = seedBank.size()
