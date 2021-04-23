extends Node
var save_game
var max_prog = 0
var start_pos = 0

func _ready():
	max_prog = $EndPosition.position.length() - $StartPosition.position.length()
	start_pos = $StartPosition.position
	load_data()

func save_data():
	save_game = File.new()
	save_game.open(globals.SAVFILE, File.WRITE)
	save_game.store_line(to_json(globals.save_game))
	save_game.close()
	load_data()

func load_data():
	save_game = File.new()
	if not save_game.file_exists(globals.SAVFILE):
		save_data()
	save_game.open(globals.SAVFILE, File.READ)
	globals.save_game = parse_json(save_game.get_line())

	$Robo.load_player() 
#	$Robo.load_position()
func _process(_delta):
	var curr_prog = $Robo.position.length() - start_pos.length()
	$HUD/TextureProgress.value = (curr_prog / max_prog) * 100
#	$Robo/Camera2D/TextureProgress/icon.global_position.x = curr_prog

func _on_AutosaveTimer_timeout():
	save_data()
