extends PlayerAbilityState
class_name PlayerAttackingState


func enter():
	super.enter()
	self.animation.play("Attack1")
	self.player.attack(self.animation.current_animation_length)
	await get_tree().create_timer(self.animation.current_animation_length
).timeout
	is_ability_done = true

