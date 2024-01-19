extends PlayerGroundedState
class_name PlayerMovingState

var input_direction: Vector2:
	get:
		return Input.get_vector("left", "right", "up", "down")
		
var direction = Vector3.ZERO

func enter():
	super.enter()
	self.animation.play("Run")

func physics_update(delta):
	super.physics_update(delta)
	if direction:
		actor.velocity.x = direction.x * actor.SPEED
		actor.velocity.z = direction.z * actor.SPEED
	else:
		actor.velocity.x = move_toward(actor.velocity.x, 0, actor.SPEED)
		actor.velocity.z = move_toward(actor.velocity.z, 0, actor.SPEED)
	
	actor.move_and_slide()

func handle_input(delta):
	super.handle_input(delta)
	
	direction = actor.input_direction
	if actor.velocity == Vector3.ZERO and direction == Vector3.ZERO:
		state_machine.change_state(state_machine.idle)
	if !actor.is_on_floor():
		state_machine.change_state(state_machine.in_air)

