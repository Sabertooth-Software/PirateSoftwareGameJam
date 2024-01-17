extends Node3D

class_name Weapon

@onready var hitbox: WeaponHitbox = $Hitbox

@export var DAMAGE: int = 5

func attack(time: float):
	hitbox.enable_hitbox(time)
