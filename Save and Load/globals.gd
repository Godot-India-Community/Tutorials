extends Node

#var players = {}
var SAVFILE = "user://save_file.sav"

var save_dict = {
	"high_score": 0
}

func _ready():
	load_data()

func save_data():
	var save_file = File.new()
	var err = save_file.open_encrypted_with_pass(SAVFILE, File.WRITE, OS.get_unique_id())
	# save_file.open(SAVFILE, File.WRITE)
	save_file.store_line(to_json(save_dict))
	save_file.close()
	load_data()


func load_data():
	var save_file = File.new()
	if not save_file.file_exists(SAVFILE):
		save_data()
#	save_file.open(SAVFILE, File.READ)
	save_file.open_encrypted_with_pass(SAVFILE, File.READ, OS.get_unique_id())
	save_dict = parse_json(save_file.get_line())
	###
	
