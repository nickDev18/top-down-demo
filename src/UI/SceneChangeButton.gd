extends Base_Button

export(String, FILE) var scene_path = ""

func _on_SceneChangeButton_button_up() -> void:
	var tree: SceneTree = get_tree()
	tree.paused = false
# warning-ignore:return_value_discarded
	tree.change_scene(scene_path)
