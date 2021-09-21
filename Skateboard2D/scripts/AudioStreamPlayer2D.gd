extends AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_LevelEndMarker_body_entered(body: Node) -> void:
	print_debug("onLevelEndMarkerBodyEntered now play collision music")
	self.play()


func _on_AudioStreamPlayer2D_finished() -> void:
	print_debug("finished audio for level end sound")


func _on_FallIntoDeathCollision_body_entered(body: Node) -> void:
	print_debug("onLevelEndFailedMarkerBodyEntered now play collision music")
	self.play()
