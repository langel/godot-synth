extends Node2D

var playback: AudioStreamPlayback = null
var sample_hz: float 
var phase = 0.0
var channels: Array[channel] = []

func _ready():
	channels.resize(16)
	for i in range(channels.size()):
		channels[i] = channel.new()
	sample_hz = $player.stream.mix_rate
	global.sample_rate = int(sample_hz)
	$player.stream.buffer_length = 0.05
	global.buffer_size = $player.stream.buffer_length
	$player.play()
	playback = $player.get_stream_playback()
	_fill_buffer()
	
func _process(_delta):
	_fill_buffer()

func _fill_buffer():
	var increment: float = 420.0 / sample_hz
	var samples: int = playback.get_frames_available()
	var sample
	for i in range(samples):
		phase = fmod(phase + increment, 1.0)
		if phase > 0.5: sample = 0.2
		else: sample = -0.2
		playback.push_frame(Vector2(sample, sample))
