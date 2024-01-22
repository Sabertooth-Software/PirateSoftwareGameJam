extends Node


var torches_total = 0.0
var torches_on = 0.0
var torches_percent : float

signal dark_changed

func add_torch(on: bool):
	torches_total+=1
	if on:
		torches_on +=1
	
func change_on(num:int):
	torches_on +=num
	torches_percent = torches_on/torches_total
	dark_changed.emit()
