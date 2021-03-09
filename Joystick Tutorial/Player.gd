extends KinematicBody2D

var velocity = Vector2.ZERO

func _process(delta):
	move_and_slide(velocity)
