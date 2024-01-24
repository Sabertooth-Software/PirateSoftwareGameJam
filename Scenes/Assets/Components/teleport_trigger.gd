extends Area3D

@export var paired_teleporter: Area3D
var cooldown = 5

func SetCooldown(amount:float):
	cooldown+=amount

func _on_body_entered(body: Node3D):
	var offset = body.position - position
	if paired_teleporter == null:
		print("Assign teleporter pair!")
	elif cooldown <=0:
		body.position = paired_teleporter.position + offset
		paired_teleporter.SetCooldown(10)

func _process(delta):
	if cooldown >=0:
		cooldown -= delta
