extends Node
class_name State

var start_time: int
var actor: CharacterBody3D
var state_machine: StateMachine
var animation: AnimationPlayer

func enter():
	start_time = Time.get_ticks_msec()
	
func exit():
	pass
	
func do_checks():
	pass
	
func physics_update(_delta):
	do_checks()

func handle_input(_delta):
	pass
