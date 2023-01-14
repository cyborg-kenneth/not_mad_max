extends Node

func instance_node(node_type, parent: Node, position): 
	var node_instance = node_type.instance()
	parent.add_child(node_instance)
	node_instance.global_position = position
	return node_instance
