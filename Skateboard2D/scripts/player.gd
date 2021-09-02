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
		$AnimatedSprite.play("skate")
		velocity.x = skatespeed
	elif Input.is_action_pressed("move_left"):
		movingright = false
		$AnimatedSprite.play("skate")
		velocity.x = -skatespeed
	else:
		velocity.x = 0 
		$AnimatedSprite.play("idle")
	
	#sets player orientation 
	if not movingright:
		$AnimatedSprite.set_flip_h(true)
	else:
		$AnimatedSprite.set_flip_h(false)
	
	if Input.is_action_pressed("jump"):
		velocity.y -= jumpvelocity	
		$AnimatedSprite.play("jump")

#actually moves player
#TODO animation when falling
func _physics_process(delta):
	velocity.y = gravityscale
	get_input()
	move_and_slide(velocity)
