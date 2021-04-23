extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = get_parent().get_parent().get_node("Player")
var speed = 3
var linear_velocity = Vector2.ZERO
var follow = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func shot():
	$CollisionShape2D.disabled = true
	$sprite.hide()
	$head.show()
	$body.show()
	follow = false
	$AnimationPlayer.play("die")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Code so that enemy follows player
	if follow:
		var target_velocity = Vector2()
		
		if player.position.x > position.x :
			target_velocity.x += speed 
			$sprite.flip_h = 0
		if player.position.x < position.x :
			target_velocity.x -= speed 
			$sprite.flip_h = 1
		if player.position.y < position.y :
			target_velocity.y -= speed 
		if player.position.y > position.y :
			target_velocity.y += speed
		
		linear_velocity = lerp(linear_velocity, target_velocity, .1)
		
		var collision = move_and_collide(linear_velocity)
		if collision != null:
			if collision.collider.has_method("die"):
				collision.collider.die()
				queue_free()
				
		if target_velocity.length() > 0 :
			$sprite.play("walk")
		elif target_velocity.length() < 0 :
			$sprite.play("walk", true)





func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "die":
		queue_free()
