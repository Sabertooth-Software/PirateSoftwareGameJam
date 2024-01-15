extends Interactable

class_name Paper

@export var UUID: PaperManager.Names

func interact():
	UiActions.interact_paper.emit(UUID)
