extends Area3D

class_name WeaponHitbox

func get_weapon() -> Weapon:
	return get_parent()
	
func enable_hitbox(time: int):
	monitorable = true
	await get_tree().create_timer(time).timeout
	monitorable = false
