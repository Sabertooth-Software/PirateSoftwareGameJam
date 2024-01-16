extends Control

class_name InteractableUI

@onready var Text: RichTextLabel = $Text

func _ready():
	InteractableEvents.change_interactable.connect(_on_change_interactable)
	PlayerActions.interact.connect(_on_interact)

func _on_change_interactable(interactable: Interactable):
	visible = interactable != null
	if visible:
		if interactable is Paper:
			Text.text = "Press E to read"

func _on_interact():
	visible = false