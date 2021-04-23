extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pause_state = false
var survived_time = 1
var screen_size
var powerup 
var powerups = ["Magazine", "Chakra"]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	screen_size = get_viewport().get_visible_rect().size
	$SpawnTimer.stop()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/SurvivedTimeLabel.text = str(int(survived_time))
	$HUD/NoOfBullets.text = str($Player.bullet_count)
	
	if $Player.position.x >= screen_size.x :
		$Player.position.x = 0
	if $Player.position.y >= screen_size.y :
		$Player.position.y = 0
	if $Player.position.x < 0 :
		$Player.position.x = screen_size.x
	if $Player.position.y < 0 :
		$Player.position.y = screen_size.y
#	pass


func _on_PauseTimer_timeout():
	survived_time += 1
		


func _on_SpawnTimer_timeout():
	var enemy = preload("res://enemy/Enemy.tscn").instance()
	enemy.global_position = get_node("spawnpoints/SpawnPoint"
		+str(randi() % $spawnpoints.get_child_count() + 1)).global_position
	$enemies.add_child(enemy)


func _on_Exit_pressed():
	get_tree().quit()


func _on_Retry_pressed():
	for child in $enemies.get_children():
		child.queue_free()
	$Player.show()
	$Player/CollisionShape2D.disabled = false
	$Player.bullet_count = 6
	survived_time = 0
	$HUD/GameOver.hide()


func _on_Play_pressed():
	$HUD/MainMenu.hide()
	$SpawnTimer.start()
	
	$Player.show()
	$Player/CollisionShape2D.disabled = false
	$Player.bullet_count = 6
	survived_time = 0
	$HUD/GameOver.hide()




func _on_PauseButton_pressed():
	# false
	get_tree().paused = !get_tree().paused
