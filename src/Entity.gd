extends Node2D
class_name Entity

export var _speed: float
export var health: int
export var is_bound_to_screen = false

var _velocity: Vector2

var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	_velocity = _calculate_velocity()
	global_position += _velocity.rotated(rotation) * _speed * delta
	if is_bound_to_screen:
		if $Sprite != null:
			var sprite: Sprite = $Sprite
			var sprite_size = sprite.get_rect().size
			global_position.x = clamp(global_position.x, sprite_size.x, screen_size.x - sprite_size.x)
			global_position.y = clamp(global_position.y, sprite_size.y, screen_size.y - sprite_size.y)
		else:
			global_position.x = clamp(global_position.x, 0, screen_size.x)
			global_position.y = clamp(global_position.y, 0, screen_size.y)
		
	
	if health <= 0:
		_destroy()

func _calculate_velocity() -> Vector2:
	return Vector2.ZERO
	
func _destroy():
	queue_free()
