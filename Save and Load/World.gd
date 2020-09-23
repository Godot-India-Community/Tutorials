extends Node
var max_prog = 0
var start_pos = 0

func _ready():
	max_prog = $EndPosition.position.length() - $StartPosition.position.length()
	start_pos = $StartPosition.position
	load_world()
	
	# loading the required variabes
func load_world():
	globals.load_data()
	$HUD/StarLabel.text = "Stars: " + str(globals.save_game["stars"])
	$Robo.load_player()
	$AutosaveTimer.start(3)


#	$Robo.load_position()
func _process(_delta):
	var curr_prog = $Robo.position.length() - start_pos.length()
	$HUD/TextureProgress.value = (curr_prog / max_prog) * 100
#	$Robo/Camera2D/TextureProgress/icon.global_position.x = curr_prog

func _on_AutosaveTimer_timeout():
	print(globals.save_game)
	globals.save_data()
	$AutosaveTimer.start(3)
