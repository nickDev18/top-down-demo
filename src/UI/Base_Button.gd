extends Button
class_name Base_Button

export(String) var button_text = ""
export(bool) var is_focused = false

func _ready() -> void:
	$Text.text = button_text

