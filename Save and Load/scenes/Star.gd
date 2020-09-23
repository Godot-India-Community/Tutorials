extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Star_body_entered(body):
#	get_tree().get_root().get_node("World").stars += 1
	globals.save_game["stars"] += 1
	globals.save_data()
	get_tree().get_root().get_node("World").load_world()
	queue_free()
