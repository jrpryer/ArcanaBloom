extends TextureRect

#var seedCount = SeedsBar.seedBank.size()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var seedCount = SeedsBar.seedBank.size()
	$Label.text = str(seedCount)
