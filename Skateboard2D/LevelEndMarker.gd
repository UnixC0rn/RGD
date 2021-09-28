tool
extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer
export var next_scene: PackedScene
onready var audio_finished: AudioStreamPlayer2D = $AudioStreamPlayer2D
#TODO 
# wenn hauptmenü steht LevelEndMarker auswählen und hauptmenü per drag and drop
#in "next_scene" propertie damit nach level ende wieder hauptmenü aufgerufen wird.

#alternative -> score anzeige oder nächstes level einfügen anstatt hauptmenü (falls vorhanden)
func _on_body_entered(body: Node) -> void:
	teleport()
	
func _get_configuration_warning() -> String:
	return "The next scene property cant be empty please add the scene which you want as next fe. main menue" if not next_scene else ""


func teleport() -> void:
	
	anim_player.play("fade_in") #play the Level finished animation
	yield(anim_player,"animation_finished") #wait for anim to finish
	get_tree().change_scene_to(next_scene) #change scene from level to the added next scene


