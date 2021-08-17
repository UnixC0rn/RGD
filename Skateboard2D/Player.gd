extends Area2D


export var speed = 400.0


func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	
	if direction.length() > 1:
		direction = direction.normalized()
	
	position += direction * speed * delta	
