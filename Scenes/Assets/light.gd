extends Interactable

class_name Light
var lightTics = .5

var Lit = true
@onready var fireLight: OmniLight3D = $FireLight
#@onready var darkLight: OmniLight3D
@onready var fireParts: GPUParticles3D = $FireParts
#@onready var darkParts: GPUParticles3D

func _changeLight():
	fireLight.omni_attenuation = randf_range(.25,.55)
	lightTics = randf_range(.05,.2)

func interact(_originator):
	Lit = !Lit
	if Lit == false:
		fireLight.light_energy = 0
		fireParts.emitting = false;
	else:
		fireLight.light_energy = 2
		fireParts.emitting = true;
func _process(delta):
	if Lit:
		lightTics -= delta
		if (lightTics <=0):
			_changeLight()
