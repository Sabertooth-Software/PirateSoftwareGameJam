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
@export var light: PackedScene

var mouse_sens = 0.005
var health: float

var health_percentage = 1

func _ready():
	health = HEALTH
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event.is_action("light") and event.is_pressed() and !event.is_echo():
		var orb: GlowingOrb = light.instantiate()
		var current_scene: Node = get_tree().get_current_scene()
		current_scene.add_child(orb)
		add_collision_exception_with(orb)
		orb.global_position = position
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sens)

func _physics_process(delta):
	state_machine.state.physics_update(delta)	
	
func _process(delta):
	var input_dir: Vector2 = Input.get_vector("left", "right", "up", "down")
	var forward = global_transform.basis.z
	var right = global_transform.basis.x
	var direction = (forward * input_dir.y + right * input_dir.x).normalized()
	input_direction = direction
	state_machine.state.handle_input(delta)

