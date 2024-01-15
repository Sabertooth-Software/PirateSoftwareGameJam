extends Control

@onready var Text: RichTextLabel = $Text

# Called when the node enters the scene tree for the first time.
func _ready():
	InteractableEvents.change_interactable.connect(_on_change_interactable)

func _on_change_interactable(interactable: Interactable):
	visible = interactable != null
	if visible:
		if interactable is Paper:
			Text.text = "Press E to read"
