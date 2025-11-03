extends Label

var out: String = ''
var j: int = 0
var newline = false

func _process(delta: float) -> void:
	var _dumb = delta
	newline = false
	out = 'key codes\n'
	j = 0
	for i in range(global.keys.size()):
		if global.keys[i] > 0:
			out += str(i) + ' '
			j += 1
			newline = true
		if (newline && j != 0 && j % 8 == 0):
			out += "\n"
			newline = false
	self.text = out
