extends AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_LevelEndMarker_body_entered(body: Node) -> void:
	self.play()



func _on_FallIntoDeathCollision_body_entered(body: Node) -> void:
	self.play()
