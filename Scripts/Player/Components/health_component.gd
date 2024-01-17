extends Node3D

class_name HealthComponent

signal die()

@export var character: CharacterBody3D
@export var health: int = 10

func _on_area_entered(area):
	print("I am hit")
	if area is WeaponHitbox:
		health -= area.get_weapon().DAMAGE
		if health <= 0:
			die.emit()
