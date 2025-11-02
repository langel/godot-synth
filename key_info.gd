extends Label

var out = ''

func _process(delta: float) -> void:
	var _dumb = delta
	out = ''
	for i in range(global.keys.size()):
		if global.keys[i] > 0:
			out += str(i) + ' '
	self.text = out
