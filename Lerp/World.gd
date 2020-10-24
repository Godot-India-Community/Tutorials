extends Node

var initial_pos = Vector2(200, 175)
var final_pos = Vector2(750, 175)
var ease_value = 0
var move = false

func _on_Button_pressed():
	$icon.position = initial_pos
	move = false


func _process(_delta):
	if move:
		if $CheckBox.pressed:
			if $LineEdit.text.empty():
				ease_value = 0
			else:
				ease_value = float($LineEdit.text)
				
			$icon.position = lerp($icon.position, final_pos, ease_value)
		else:
			$icon.position = final_pos

func _on_lerp_toggled(_button_pressed):
	move = true
