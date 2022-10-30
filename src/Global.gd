extends Node2D

var player: Node2D
var node_parent
var camera

var score: int = 0
var highscore: int = 0
var scene_tree: SceneTree

func instantiate(node, location: Vector2, parent: Node, tree_index: int) -> Node:
	var obj = node.instance()
	parent.add_child(obj)
	parent.move_child(obj, tree_index)
	obj.global_position = location
	return obj
	
func get_input_dir() -> Vector2:
	return get_local_mouse_position()
	
func restart_scene():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	
