extends KinematicBody2D

var movingright
var velocity = Vector2()
var skatespeed = 700
var gravityscale = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	movingright = true # Replace with function body.

#sets input vars so that we know how the player is supposed to move
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
	
	if not movingright:
		$AnimatedSprite.set_flip_h(true)
	else:
		$AnimatedSprite.set_flip_h(false)

#actually moves player
func _physics_process(delta):
	velocity.y = gravityscale
	get_input()
	move_and_slide(velocity)
