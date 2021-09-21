extends Button

export(String,FILE) var next_scene_path: = "res://Levels/FirstLevel.tscn"

func _on_StartGameButton_button_up() -> void:
	#play game when buttonpress is released
	get_tree().change_scene(next_scene_path)

func _get_configuration_warning() -> String:
	return "next_scene_path must be set" if next_scene_path == "" else ""
