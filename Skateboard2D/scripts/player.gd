extends KinematicBody2D

var movingright
var velocity = Vector2.ZERO
export (int) var skatespeed = 500
export (int) var gravity = 3500
export (int) var jumpvelocity = -1300

# Called when the node enters the scene tree for the first time.
func _ready():
	movingright = true # Replace with function body.

#sets input vars so that we know how the player is supposed to move
#TODO animation when falling
func get_input():
	#left/right movement
	if Input.is_action_pressed("move_right"):
		movingright = true
		velocity.x = skatespeed
	elif Input.is_action_pressed("move_left"):
		movingright = false	
		velocity.x = -skatespeed
	else: 
		velocity.x = 0 
	
	#sets player orientation 
	if not movingright:
		$AnimatedSprite.set_flip_h(true)
	else:
		$AnimatedSprite.set_flip_h(false)

#actually moves player
#TODO animation when falling
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	#second parameter determines what is the up direction, so that we know where the floor is for animations and such
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if (velocity.x == 0 && is_on_floor()):
		$AnimatedSprite.play("idle")
	if (velocity.x != 0 && is_on_floor()):
		$AnimatedSprite.play("skate")
	if Input.is_action_just_pressed("jump"):
		if (is_on_floor()):
			$AnimatedSprite.play("jump")
			velocity.y = jumpvelocity	
