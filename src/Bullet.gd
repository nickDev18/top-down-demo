extends Entity

var look_once = true
var shoot_vector = Vector2.RIGHT
export var damage : int

func _calculate_velocity():
	return Vector2.RIGHT

func set_shoot_dir(shoot_direction: Vector2):
	shoot_vector = shoot_direction

func _process(_delta: float) -> void:
	if look_once:
		look_at(shoot_vector)
		look_once = false


func _on_VisibilityNotifier2D_screen_exited() -> void:
	_destroy()
