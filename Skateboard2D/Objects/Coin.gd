extends Area2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var anim_player: AnimationPlayer = $AnimationPlayer
onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
var played_audio: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Coin_body_entered(body: Node) -> void:
	if !played_audio :
		audio_player.play()
		played_audio = true
	anim_player.play("Fade_out")
	
