extends Button

export(String,FILE) var next_scene_path: = "res://Screens/EngineScreen.tscn"
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
# get_tree().change_scene(next_scene_path)


func _on_TempButton_button_up() -> void:
	get_tree().change_scene(next_scene_path)
