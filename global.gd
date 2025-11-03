extends Node

@onready var main = get_node("/root/main")

var score = 0
var keys : PackedInt32Array
var key2channel : PackedInt32Array
var channel_max : int = 16
var channel_next: int = 0
var buffer_size : float
var sample_rate : int

func _ready():
	keys.resize(256)
	keys.fill(0)
	key2channel.resize(256)
	key2channel.fill(-1)

func _input(ev):
	if ev is InputEventKey:
		var key = ev.keycode & 0xff
		if ev.is_pressed():
			keys[key] += 1
			if keys[key] == 1:
				main.channels[channel_next].turn_on(key)
				key2channel[key] = channel_next
				channel_next = (channel_next + 1) % channel_max	
		else:
			main.channels[key2channel[key]].turn_off()
			keys[key] = 0
			key2channel[key] = -1
