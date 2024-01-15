extends Interactable

class_name Paper

@export var UUID: PaperManager.Names

func interact(_originator):
	UiActions.interact_paper.emit(UUID)
