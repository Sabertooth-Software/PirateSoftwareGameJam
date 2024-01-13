extends CharacterBody3D

class_name Player

signal set_health(percentage: float)

@onready var state_machine: PlayerStateMachine = $StateMachine
@onready var animations: AnimationPlayer = $Robot/AnimationPlayer
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") 
var input_direction: Vector3
var player: Node3D

@export var SPEED: float
@export var JUMP_VELOCITY: float = 5
@export var HEALTH: float
@export var acceleration: float

var health: float

var health_percentage = 1

func _ready():
	health = HEALTH
	

func _physics_process(delta):
	state_machine.state.physics_update(delta)	
	
func _process(delta):
	var input_dir: Vector2 = Input.get_vector("left", "right", "up", "down")
	#var forward = global_transform.basis.z
	#var right = global_transform.basis.x
	#var direction = (forward * input_dir.y + right * input_dir.x).normalized()
	var direction = Vector3(input_dir.x, 0, input_dir.y)
	input_direction = direction
	state_machine.state.handle_input(delta)
	if input_direction != Vector3.ZERO:
		look_at(position + input_direction)
