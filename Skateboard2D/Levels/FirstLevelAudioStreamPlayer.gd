extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
export var legally_ended: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_AudioStreamPlayer_finished() -> void:
	if legally_ended:
		self.play()



func _on_DeathCollisionMarker_body_entered(body: Node) -> void:
	stop_music_on_fail()


func _on_LevelEndMarker_body_entered(body: Node) -> void:
	stop_music_on_fail()

func stop_music_on_fail() : 
	legally_ended = false
	self.stop()
