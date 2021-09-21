extends AudioStreamPlayer2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
func play_button_click_sound() -> void:
	self.play()

func _on_StartGameButton_button_down() -> void:
	play_button_click_sound()

func _on_ExitGameButton_button_down() -> void:
	play_button_click_sound()
