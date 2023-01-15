extends Position2D

var sand_road_A = preload("res://Road/SandRoadA.tscn")

onready var oldest_son = get_node("SandRoadA")

func _ready():
	print(oldest_son.global_position)
	print(global_position)

func _process(_delta):
	if oldest_son != null and oldest_son.global_position.y >= 400: 
		var new_node = Utils.instance_node(sand_road_A, self, oldest_son.global_position - Vector2(0, 1000))
		oldest_son = new_node
