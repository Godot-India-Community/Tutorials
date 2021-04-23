extends TextureProgress

func _process(delta):
	$icon.position.x = value *  rect_size.x / 100
