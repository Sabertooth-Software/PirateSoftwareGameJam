extends PlayerState
class_name PlayerInAirState

var direction: Vector3
var is_jumping: bool
var cut_jump: bool
var time_since_jump: int
var jump_input_stop: bool:
	get: return state_machine.jumping.jump_input_stop
var gravity

func enter():
	super.enter()
	state_machine.animation_player.play("Fall2")
	
func physics_update(delta):
	super.physics_update(delta)
	actor.velocity.y -= actor.gravity * delta
	if actor.velocity.y < 0:
		state_machine.animation_player.play("Fall")
	if direction:
		actor.velocity.x = direction.x * actor.SPEED
		actor.velocity.z = direction.z * actor.SPEED
	else:
		actor.velocity.x = move_toward(actor.velocity.x, 0, actor.SPEED)
		actor.velocity.z = move_toward(actor.velocity.z, 0, actor.SPEED)
	
	
	actor.move_and_slide()

func handle_input(delta):
	direction = actor.input_direction
	super.handle_input(delta)
	if actor.is_on_floor():
		state_machine.change_state(state_machine.idle)
	elif Input.is_action_just_pressed("jump") and state_machine.jumping.can_jump():
		state_machine.change_state(state_machine.jumping)


func check_jump_multiplier():
	if is_jumping:
		time_since_jump = Time.get_ticks_msec() - start_time
		if !cut_jump:
			cut_jump = !Input.is_action_pressed("jump") and time_since_jump < 200
		if cut_jump and 200 < time_since_jump:
			actor.velocity.y = 0
			is_jumping = false
			cut_jump = false
		elif actor.velocity.y >= 0:
			is_jumping = false;
			cut_jump = false;
			
func exit():
	super.exit()
	state_machine.animation_player.play("Crouch")

