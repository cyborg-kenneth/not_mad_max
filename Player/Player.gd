extends KinematicBody2D

const PlayerBullet = preload("res://Player/PlayerBullet.tscn")

export (int) var MAX_SPEED = 150
export (int) var ACCELERATION = 500
export (int) var FRICTION = 300

var velocity = Vector2.ZERO
var can_fire = true

onready var fire_rate = get_node("FireRate")
onready var gun_sound = get_node("Gun")

func _physics_process(delta):
	var input_vector = get_input_vector()
	if input_vector != Vector2.ZERO: 
		velocity = velocity.move_toward(input_vector * MAX_SPEED, delta * ACCELERATION)
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, delta * FRICTION)
	velocity = move_and_slide(velocity)
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_fire: 
		fire()
func get_input_vector()->Vector2: 
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input_vector.normalized()
	
func fire(): 
	var main = get_tree().current_scene
	gun_sound.play()
	var bullet = Utils.instance_node(PlayerBullet, main, global_position)
	var direction = (get_global_mouse_position() - global_position).normalized()
	if direction != Vector2.ZERO: 
		bullet.direction = direction
		bullet.rotation = direction.angle()
	can_fire = false
	fire_rate.start()


func _on_FireRate_timeout():
	can_fire = true
