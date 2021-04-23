extends KinematicBody2D

var linear_velocity = Vector2()

func _process(delta):
	linear_velocity += Vector2(0, .980)
	linear_velocity = move_and_slide(linear_velocity)
