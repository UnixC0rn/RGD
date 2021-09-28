extends KinematicBody2D

var movingright
var velocity = Vector2.ZERO
export (int) var skatespeed = 500
export (int) var gravity = 3500
export (int) var jumpvelocity = -1300
export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.2
var dir = 0
var landing : bool
var speedboost = false
var timer
onready var audio_land: AudioStreamPlayer = $LandingSound
onready var audio_jump: AudioStreamPlayer = $JumpingSound #anbinden sobald landing anständig detcted

# Called when the node enters the scene tree for the first time.
func _ready():
	movingright = true # Replace with function body.
	timer = Timer.new()
	timer.connect("timeout", self, "_on_timer_timeout")
	add_child(timer)
	timer.set_one_shot(true)

#sets input vars so that we know how the player is supposed to move
#TODO animation when falling
func get_input():
	dir = 0
	#left/right movement
	if Input.is_action_pressed("move_right"):
		movingright = true
		dir += 1
	elif Input.is_action_pressed("move_left"):
		movingright = false	
		dir -= 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * skatespeed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
	
	#sets player orientation 
	if not movingright:
		$AnimatedSprite.set_flip_h(true)
	else:
		$AnimatedSprite.set_flip_h(false)

#actually moves player
#TODO animation when falling
func _physics_process(delta):
	get_input()
	if speedboost:
		velocity.x = velocity.x * 2
		speedboost = false
	velocity.y += gravity * delta
	#second parameter determines what is the up direction, so that we know where the floor is for animations and such
	velocity = move_and_slide(velocity, Vector2.UP)
	if (dir == 0 && is_on_floor()):
		$AnimatedSprite.play("idle")
	if (dir != 0 && is_on_floor()):
		$AnimatedSprite.play("skate")
	if Input.is_action_just_pressed("jump"):
		if (is_on_floor()):
			$AnimatedSprite.play("jump")
			velocity.y = jumpvelocity
			audio_jump.play()
	if (is_on_floor()):
		if landing:
			landing = false
			start_timer_for_pl()
	else:
		if !landing:
			landing = true
	if landing:
		print("landing")	
	if (Input.is_action_just_pressed("accel") && !(timer.is_stopped())):
		timer.stop()
		speedboost = true
		print("PERFECT LANDING")

func start_timer_for_pl():
	var perfect_landing_time = 0.25
	timer.start(perfect_landing_time)

func _on_timer_timeout():
	print("timer timeout")
