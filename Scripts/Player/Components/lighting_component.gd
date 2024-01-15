extends Node3D

class_name LightingComponent

signal use_light_ability(originator: Node3D)
signal toggle_torch()

@export var flare: PackedScene
@onready var torch: Torch = $Torch

func _ready():
	use_light_ability.connect(_on_use_light_ability)
	toggle_torch.connect(_on_toggle_torch)

func _on_use_light_ability(originator: Node3D):
	var orb: GlowingOrb = flare.instantiate()
	var current_scene: Node = get_tree().get_current_scene()
	current_scene.add_child(orb)
	originator.add_collision_exception_with(orb)
	orb.global_position = originator.position
	
func _on_toggle_torch():
	torch.visible = !torch.visible
