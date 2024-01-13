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
	player.velocity.y -= player.gravity * delta
	if player.velocity.y < 0:
		state_machine.animation_player.play("Fall")
	if direction:
		player.velocity.x = direction.x * player.SPEED
		player.velocity.z = direction.z * player.SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		player.velocity.z = move_toward(player.velocity.z, 0, player.SPEED)
	
	
	player.move_and_slide()

func handle_input(delta):
	direction = player.input_direction
	super.handle_input(delta)
	if player.is_on_floor():
		state_machine.change_state(state_machine.idle)
	elif Input.is_action_just_pressed("jump") and state_machine.jumping.can_jump():
		state_machine.change_state(state_machine.jumping)


func check_jump_multiplier():
	if is_jumping:
		time_since_jump = Time.get_ticks_msec() - start_time
		if !cut_jump:
			cut_jump = !Input.is_action_pressed("jump") and time_since_jump < 200
		if cut_jump and 200 < time_since_jump:
			player.velocity.y = 0
			is_jumping = false
			cut_jump = false
		elif player.velocity.y >= 0:
			is_jumping = false;
			cut_jump = false;
			
func exit():
	super.exit()
	state_machine.animation_player.play("Crouch")

