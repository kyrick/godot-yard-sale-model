extends Node2D

class_name Agent

export var wealth: = 10000.0
export var take_percent: = 17.0
export var give_percent: = 20.0
export var take_from_poor_probability: = 50.0

onready var max_wealth: = wealth setget set_max_wealth


func _process(_delta):
	var highlight = wealth/max_wealth
	$Sprite.modulate = Color(0, highlight, 0)


func set_max_wealth(new_max_weath: float):
	max_wealth = new_max_weath


func is_wealthier(other: Agent):
	return wealth > other.wealth


func exchange(other: Agent):
	var wealthy = null
	var poor = null
	
	if is_wealthier(other): 
		wealthy = self
		poor = other
	else:
		wealthy = other
		poor = self

	if randi() % 101 < take_from_poor_probability:
		var take_from_poor = poor.wealth * (take_percent/100)
		wealthy.wealth += take_from_poor
		poor.wealth -= take_from_poor
	else:
		var give_to_poor = poor.wealth * (give_percent/100)
		wealthy.wealth -= give_to_poor
		poor.wealth += give_to_poor
