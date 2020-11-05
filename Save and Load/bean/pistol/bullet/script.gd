extends KinematicBody2D

var velocity
var speed = 10
var by = ""
var dir 

func start(pos, _dir):
	position = pos
	rotation = _dir.angle()
	velocity = speed * _dir
	dir = _dir
	
func _process(_delta):
	var collision = move_and_collide(velocity)
	if collision != null:
		if collision.collider.has_method("shot"):
			collision.collider.shot()
			queue_free()
