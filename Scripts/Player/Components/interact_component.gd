extends Node3D

class_name InteractComponent

signal interact(originator: PhysicsBody3D)

@onready var sensor: RayCast3D = $Sensor

var current_interactable: Interactable

func _ready():
	current_interactable = null
	interact.connect(_on_interact)
	InteractableEvents.change_interactable.connect(_on_change_interactable)
	
func _physics_process(_delta):
	if sensor.is_colliding():
		assert(sensor.get_collider() is InteractableArea)
		if current_interactable != sensor.get_collider().get_interactable():
			InteractableEvents.change_interactable.emit(sensor.get_collider().get_interactable())
	else:
		if current_interactable != null:
			InteractableEvents.change_interactable.emit(null)

func _on_interact(originator: PhysicsBody3D):
	if current_interactable != null:
		PlayerActions.interact.emit()
		current_interactable.interact(originator)
		current_interactable = null

func _on_change_interactable(interactable: Interactable):
	current_interactable = interactable

