extends Base_Button

func _on_SceneChangeButton_button_up() -> void:
	Global.scene_tree.quit()
