extends AnimationPlayer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_TextureRect_focus_entered() -> void:
	print_debug("focusEntered")


func _on_ColorRect_ready() -> void:
	self.play("Fade_out")
