extends Control


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
export var highscore: String = ""
const SAVE_FILE_PATH = "user://savedata.save"
onready var label: Label = $ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_load_highscore()

func _load_highscore():
	var save_data = File.new()
	if save_data.file_exists(SAVE_FILE_PATH):
		save_data.open(SAVE_FILE_PATH,File.READ)
		highscore = save_data.get_var()
	save_data.close()
	label.text = "Current Highscore\n"+highscore
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
