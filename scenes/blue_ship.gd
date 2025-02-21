extends RigidBody2D

var speed = 500


func _physics_process(delta):
	var input = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		input.x += 1
	if Input.is_action_pressed("move_left"):
		input.x -= 1
	if Input.is_action_pressed("move_down"):
		input.y += 1
	if Input.is_action_pressed("move_up"):
		input.y -= 1

	linear_velocity = input.normalized() * speed

	if input.length() > 0:
		rotation = input.angle() + PI / 2  
