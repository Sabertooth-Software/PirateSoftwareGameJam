extends Area3D

class_name InteractableArea
	
func get_interactable() -> Interactable:
	return get_parent() as Interactable
