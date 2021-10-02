extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_StartGameButton_button_down() -> void:
	_play_Button_click_Sound()


func _on_TempButton_button_down() -> void:
	_play_Button_click_Sound()

func _on_ExitGameButton_button_down() -> void:
	_play_Button_click_Sound()

func _play_Button_click_Sound() -> void:
	self.play()


