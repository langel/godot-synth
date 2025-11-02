extends Label


func _process(delta):
	var _dumb = delta
	if Input.is_action_just_pressed("ui_left"):
		global.score += 1
	self.text = str(global.score)
