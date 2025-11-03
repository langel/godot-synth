extends Node

var score = 0
var keys : PackedInt32Array
var buffer_size : float
var sample_rate : int

func _ready():
	keys.resize(256)
	keys.fill(0)
	

func _input(ev):
	if ev is InputEventKey:
		var key = ev.keycode & 0xff
		if ev.is_pressed():
			keys[key] += 1	
		else:
			keys[key] = 0
