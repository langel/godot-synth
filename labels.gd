extends Node

@onready var global = get_node("/root/global")
@onready var main = get_node("/root/main")
@onready var buffer_size: Label = $"/root/main/buffer_size"
@onready var sample_rate: Label = $"/root/main/sample_rate"
@onready var note_values1: Label = $"/root/main/note_values1"
@onready var note_values2: Label = $"/root/main/note_values2"


func _process(_delta):
	buffer_size.text = "buffer size\n%.3f" % global.buffer_size
	sample_rate.text = "sample rate\n" + str(global.sample_rate)
	note_values1.text = ''
	note_values2.text = ''
	for i in range(global.channel_max):
		if (i % 2) == 0:
			if main.channels[i].enabled:
				note_values1.text = note_values1.text + str(main.channels[i].frequency)
			note_values1.text = note_values1.text + "\n"
		else:
			if main.channels[i].enabled:
				note_values2.text = note_values2.text + str(main.channels[i].frequency)
			note_values2.text = note_values2.text + "\n"
