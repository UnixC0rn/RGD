extends Area2D

export(String,FILE) var next_scene_path: = "res://Screens/MissionFailedScreen.tscn"
onready var anim_player: AnimationPlayer = $AnimationPlayer
onready var death_sound: AudioStreamPlayer = $DeathSound
var player_finished_level_with_succes: bool = false
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _on_DeathCollisionMarker_body_entered(body: Node) -> void:
	if player_finished_level_with_succes:
		return #Ensure that after hitting the goal you cant die while next scene gets prepared
	death_sound.play()
	anim_player.play("fade_in") #play the Level finished animation
	yield(anim_player,"animation_finished") #wait for anim to finish
	get_tree().change_scene(next_scene_path)


func _on_LevelEndMarker_body_entered(body: Node) -> void:
	player_finished_level_with_succes = true
