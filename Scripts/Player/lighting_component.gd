extends Node3D

class_name LightingComponent

@export var flare: PackedScene
@onready var torch: Torch = $Torch

func _ready():
	PlayerActions.send_flare.connect(_on_send_flare)
	PlayerActions.toggle_torch.connect(_on_toggle_torch)

func _on_send_flare(spawn_position: Vector3):
	var orb: GlowingOrb = flare.instantiate()
	var current_scene: Node = get_tree().get_current_scene()
	current_scene.add_child(orb)
	get_parent().add_collision_exception_with(orb)
	orb.global_position = spawn_position
	
func _on_toggle_torch():
	torch.visible = !torch.visible
	print(torch.spot_range)
