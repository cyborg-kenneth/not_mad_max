extends KinematicBody2D

export (int) var MAX_SPEED = 150
export (int) var ACCELERATION = 100
export (int) var FRICTION = 300

var velocity = Vector2.ZERO

func _physics_process(delta):
	var input_vector = get_input_vector()
	if input_vector != Vector2.ZERO: 
		velocity = velocity.move_toward(input_vector * MAX_SPEED, delta * ACCELERATION)
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, delta * FRICTION)
	velocity = move_and_slide(velocity)
func get_input_vector()->Vector2: 
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input_vector
