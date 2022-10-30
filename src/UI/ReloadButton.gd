extends Base_Button

func _on_SceneChangeButton_button_up() -> void:
	Global.scene_tree.paused = false
# warning-ignore:return_value_discarded
	Global.scene_tree.reload_current_scene()
