extends Node

var SAVFILE = "res://save_game.json"

var save_game = {
	"player_position": "Vector2(320, 435)",
	"player_face": 1,
	"stars": 0
}

func save_data():
	var save_file = File.new()
	save_file.open(SAVFILE, File.WRITE)
	save_file.store_line(to_json(save_game))
	save_file.close()
	load_data()


func load_data():
	var save_file = File.new()
	if not save_file.file_exists(SAVFILE):
		save_data()
	save_file.open(SAVFILE, File.READ)
	save_game = parse_json(save_file.get_line())
	
