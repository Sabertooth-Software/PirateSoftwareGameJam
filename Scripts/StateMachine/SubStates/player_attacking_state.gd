extends PlayerAbilityState
class_name PlayerAttackingState


func enter():
	super.enter()
	self.animation.play("Attack1")
	await get_tree().create_timer(self.animation.current_animation_length
).timeout
	is_ability_done = true

