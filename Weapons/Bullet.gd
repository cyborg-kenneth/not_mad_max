extends Area2D

export (int) var SPEED = 100

var direction: Vector2 = Vector2.UP
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	global_position += direction * SPEED * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
