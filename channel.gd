class_name channel extends Node

var enabled = false
var frequency = 0.0
var increment = 0.0
var phase = 0.0
var sample = 0.0

func turn_on(key_code):
	enabled = true
	if key_code > 100:
		frequency = float(key_code) * 0.5
	else:
		frequency = 420.0 - float(key_code) * 3.33
	increment = frequency / global.sample_rate
	
func turn_off():
	enabled = false

func get_sample():
	if (enabled == true):
		phase = fmod(phase + increment, 1.0)
		if phase > 0.5: sample = 0.2
		else: sample = -0.2
		return sample
	else:
		return 0.0
