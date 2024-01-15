extends PlayerAbilityState
class_name PlayerFlareState

var number_of_flares: int = 3

func enter():
	super.enter()
	if can_use_flare():
		self.animation.play("Crouch")
		await get_tree().create_timer(.1).timeout
		player.lighting_component.use_light_ability.emit(player)
		await get_tree().create_timer(.3).timeout
		number_of_flares -= 1
	is_ability_done = true
	
func can_use_flare():
	return number_of_flares > 0
