extends Node2D

var playback: AudioStreamPlayback = null
var channels: Array[channel] = []

func _ready():
	channels.resize(global.channel_max)
	for i in range(channels.size()):
		channels[i] = channel.new()
	global.sample_rate = int($player.stream.mix_rate)
	$player.stream.buffer_length = 0.05
	global.buffer_size = $player.stream.buffer_length
	$player.play()
	playback = $player.get_stream_playback()
	_fill_buffer()
	
func _process(_delta):
	_fill_buffer()

func _fill_buffer():
	var samples: int = playback.get_frames_available()
	for i in range(samples):
		var sample = 0.0
		for j in range(channels.size()):
			sample += channels[j].get_sample()
		playback.push_frame(Vector2(sample, sample))
