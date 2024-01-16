extends Node3D

class_name AttackComponent

@export var weapon: Weapon

func attack(time: int):
	weapon.attack(time)
