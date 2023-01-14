extends Position2D

export (int) var SPEED = 300

func _physics_process(delta):
	position += Vector2.DOWN * SPEED * delta

func _on_VisibilityNotifier2D_screen_exited():
	print("Bye")
	queue_free()
