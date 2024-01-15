extends Area3D

class_name InteractableArea

func _process(delta):
	pass
	
func get_interactable() -> Interactable:
	return get_parent() as Interactable
