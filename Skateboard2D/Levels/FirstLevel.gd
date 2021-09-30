extends Area2D

onready var timer: Node = $TimeTracker
const SAVE_FILE_PATH = "user://savedata.save"

var curr_score_as_string: String = ""
var high_score_as_string: String = ""

var debug_score_resetter: bool = false
var first_entered_level_end: bool = false

func _ready() -> void:
	if debug_score_resetter :
		_clear_highscore()
	_load_highscore()

func _clear_highscore() :
	print("clearing highscore")
	var score_data = File.new()
	score_data.open(SAVE_FILE_PATH,File.WRITE)
	score_data.store_var("99:99:999")
	score_data.close()
	print("highscore cleared")

func _on_DeathCollisionMarker_body_entered(body: Node) -> void:
	_stop_timer()


func _on_LevelEndMarker_body_entered(body: Node) -> void:
	_stop_timer()
	if !first_entered_level_end:
		first_entered_level_end = true
		_load_score_and_check_for_highscore()

func _load_score_and_check_for_highscore() -> void:
	curr_score_as_string = timer.passed_time
	_load_highscore()
	
	print("back from loading highscore the old one is " + high_score_as_string + " the currScore is " +curr_score_as_string)
	if(high_score_as_string.length() == 0):
		_save_highscore() #if this is first score then save it as highscore
	else :
		_compare_highscore_with_curr_score_and_save()

func _compare_highscore_with_curr_score_and_save():
	var splittet_high_score = high_score_as_string.split(":",false,3)
	var splittet_curr_score = curr_score_as_string.split(":",false,3)
	
	
	#check mins
	if splittet_high_score[0] as int < splittet_curr_score[0] as int :
		return
	if splittet_high_score[0] as int > splittet_curr_score[0] as int :
		_save_highscore()
		return
		
	#check secs
	if splittet_high_score[1] as int < splittet_curr_score[1] as int :
		return
	if splittet_high_score[1] as int > splittet_curr_score[1] as int :
		_save_highscore()
		return
		
	#check mills
	if splittet_high_score[2] as int < splittet_curr_score[2] as int :
		return
	if splittet_high_score[2] as int > splittet_curr_score[2] as int :
		_save_highscore()
		return
	return #exact same time just return

func _stop_timer():
	timer.timer_on = false

func _save_highscore():
	var save_data = File.new()
	save_data.open(SAVE_FILE_PATH, File.WRITE)
	save_data.store_var(curr_score_as_string)

func _load_highscore():
	var save_data = File.new()
	if save_data.file_exists(SAVE_FILE_PATH):
		save_data.open(SAVE_FILE_PATH,File.READ)
		high_score_as_string = save_data.get_var()
	save_data.close()
