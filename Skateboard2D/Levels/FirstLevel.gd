extends Area2D

onready var timer: Node = $TimeTracker


func _on_DeathCollisionMarker_body_entered(body: Node) -> void:
	_stop_timer()


func _on_LevelEndMarker_body_entered(body: Node) -> void:
	_stop_timer()
	
func _stop_timer():
	timer.timer_on = false
