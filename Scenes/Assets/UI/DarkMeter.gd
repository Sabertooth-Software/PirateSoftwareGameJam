extends VSlider


func _ready():
	DarkTracker.dark_changed.connect(_on_dark_changed)


func _on_dark_changed():
	max_value = DarkTracker.torches_total
	value = DarkTracker.torches_on
