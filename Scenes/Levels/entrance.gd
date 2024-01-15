extends Area3D

@export var particle_effect: PackedScene
var _node_name = "Sparkles"

func _on_body_entered(body: Node3D):
	if body.get_node_or_null(_node_name) == null:
		var particle_node: GPUParticles3D = particle_effect.instantiate()
		particle_node.name = _node_name
		body.add_child(particle_node)
