extends KinematicBody2D


export var speed = 200
var bullet_count = 6
var p
var linear_velocity = Vector2()

func _ready():
	p = get_parent()

func _physics_process(delta):
	# apply gravity
	
	
	# Shoot
	if Input.is_action_just_pressed("shoot") and bullet_count > 0 :
		$gun.shoot()
		bullet_count -= 1
	
	var target_velocity = Vector2()
	
	if Input.is_action_pressed("ui_left"):
		target_velocity.x -= speed 
	if Input.is_action_pressed("ui_right"):
		target_velocity.x += speed 
	if Input.is_action_pressed("ui_up"):
		target_velocity.y -= speed 
	if Input.is_action_pressed("ui_down"):
		target_velocity.y += speed
	
	linear_velocity = lerp(linear_velocity, target_velocity, .1)
	linear_velocity = move_and_slide(linear_velocity)
	
	if target_velocity.length() > 0 :
		$sprite.play("walk")
	elif target_velocity.length() < 0 :
		$sprite.play("walk", true)
	else:
		$sprite.play("idle")
	
func reload():
	bullet_count = 6

func die():
	hide()
	$CollisionShape2D.disabled = true
	if p.survived_time > g.save_dict.high_score:
		g.save_dict.high_score = p.survived_time
	
	p.get_node("HUD/GameOver/V/MaxScoreLabel").text = "Your Score was: " + str(p.survived_time)
	p.get_node("HUD/GameOver/V/HighScoreLabel").text = "High Score is: " + str(g.save_dict["high_score"])
	p.get_node("AnimationPlayer").play("game_over")


