extends Node


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var time = 0
export var timer_on = false
export var passed_time: String = "%02d : %02d : %03d" % [0,0,0]
var mils = 0
var secs = 0
var mins = 0
onready var label: Label = $CanvasLayer/Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer_on = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(timer_on):
		time+=delta
	mils = fmod(time,1)*1000
	var old_secs = secs
	secs = fmod(time,60)
	mins = fmod(time,60*60) / 60
	
	passed_time = "%02d : %02d : %03d" % [mins,secs,mils]
	label.text = passed_time

