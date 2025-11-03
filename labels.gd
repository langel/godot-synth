extends Node

@onready var global = get_node("/root/global")
@onready var buffer_size: Label = $"/root/main/buffer_size"
@onready var sample_rate: Label = $"/root/main/sample_rate"

#import "res://global.gd" as global

func _process(_delta):
	buffer_size.text = str(global.buffer_size)
	sample_rate.text = str(global.sample_rate)
