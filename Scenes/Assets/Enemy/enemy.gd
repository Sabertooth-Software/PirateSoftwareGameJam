extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var nav: NavigationAgent3D = $NavigationAgent3D

@export var target: CharacterBody3D

var movement_delta = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		print('not on floor')
		velocity.y -= gravity * delta
		move_and_slide()
	if nav.is_navigation_finished():
		print('finished')
		## Put in ai decision tree here
		nav.set_target_position(target.position)
		return
	if target != null and is_on_floor():
		print("i'm in there")
		nav.set_target_position(target.position)
		movement_delta = SPEED * delta * .5
		var next_path_position: Vector3 = nav.get_next_path_position()
		var current_agent_position: Vector3 = global_transform.origin
		var new_velocity: Vector3 = (next_path_position - current_agent_position).normalized() * movement_delta
		nav.set_velocity(new_velocity)

func _on_navigation_agent_3d_velocity_computed(safe_velocity):
	print(safe_velocity)
	look_at(nav.get_final_position())
	rotation_degrees.x = clamp(rotation_degrees.x, 0, 0)	
	
	global_transform.origin = global_transform.origin.move_toward(global_transform.origin + safe_velocity, movement_delta)

func _on_health_component_die():
	call_deferred("queue_free")
