extends AudioStreamPlayer2D

var already_entered: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_LevelEndMarker_body_entered(body: Node) -> void:
	if !already_entered: # ensure to play succes music only once
		already_entered = true
		self.play()



