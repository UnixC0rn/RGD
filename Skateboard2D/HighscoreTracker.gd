extends Node


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
const SAVE_FILE_PATH = "user://savedata.save"
var highscore_mins = 0
var highscore_secss = 0
var highscore_mills = 0

var curr_score_mins = 0
var curr_score_secs = 0
var curr_score_mills = 0

var curr_score_as_string: String = ""
var high_score_as_string: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_load_highscore()

#parse score to string
#reparse from string to score

func _save():
	var save_data = File.new()
	save_data.open(SAVE_FILE_PATH, File.WRITE)
	save_data.store_var(high_score_as_string)

func _load_highscore():
	var save_data = File.new()
	if save_data.file_exists(SAVE_FILE_PATH):
		save_data.open(SAVE_FILE_PATH,File.READ)
		high_score_as_string = save_data.get_var()
	save_data.close()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
