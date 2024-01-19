extends Node

class_name StateMachine
const DEBUG = true

var state: State

@export var actor: CharacterBody3D
@export var animation_player: AnimationPlayer


func _ready():
	state = get_child(0) as State
	state.state_machine = self
	state.actor = actor
	state.animation = animation_player
	state.enter()
	
func change_state(new_state: State):
	state.exit()
	state = new_state
	if !state.state_machine:
		state.state_machine = self
	if !state.actor:
		state.actor = self.actor
	if !state.animation:
		state.animation = animation_player
	state.enter()
