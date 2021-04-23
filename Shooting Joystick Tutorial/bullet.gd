extends Area2D

var speed = 75
var velocity = Vector2()

func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

func _process(delta):
	position += velocity * delta * 5
