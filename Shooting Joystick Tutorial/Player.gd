extends KinematicBody2D

var velocity = Vector2.ZERO
var cooldown = false 

func _process(delta):
	move_and_slide(velocity)

func shoot():
	if cooldown:
		var bullet = load("res://bullet.tscn").instance()
		
		var pos = $turret/point.global_position 
		var dir = $turret/point.global_rotation 
		
		bullet.start(pos, dir)
		get_tree().get_root().add_child(bullet)
		
		cooldown = false


func _on_Timer_timeout():
	cooldown = true
