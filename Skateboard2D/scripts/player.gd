extends KinematicBody2D

var movingright
var velocity = Vector2()
var skatespeed = 700
var gravityscale = 500
var jumpvelocity = 1500

# Called when the node enters the scene tree for the first time.
func _ready():
	movingright = true # Replace with function body.

#sets input vars so that we know how the player is supposed to move
#TODO animation when falling
func get_input():
	#left/right movement
	if Input.is_action_pressed("move_right"):
		movingright = true
		if (is_on_floor()):	
			$AnimatedSprite.play("skate")
		velocity.x = skatespeed
	elif Input.is_action_pressed("move_left"):
		movingright = false
		if (is_on_floor()):
			$AnimatedSprite.play("skate")
		velocity.x = -skatespeed
	else:
		if (is_on_floor()):
			$AnimatedSprite.play("idle")
		velocity.x = 0 
	
	#sets player orientation 
	if not movingright:
		$AnimatedSprite.set_flip_h(true)
	else:
		$AnimatedSprite.set_flip_h(false)
	
	if Input.is_action_pressed("jump"):
		$AnimatedSprite.play("jump")
		velocity.y -= jumpvelocity	

#actually moves player
#TODO animation when falling
func _physics_process(delta):
	velocity.y = gravityscale
	get_input()
	#second parameter determines what is the up direction, so that we know where the floor is for animations and such
	move_and_slide(velocity, Vector2(0,-1))
