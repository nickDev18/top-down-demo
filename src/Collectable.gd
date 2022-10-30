extends Entity

var move_vector: Vector2
var player_in_range = false
var is_knockedback = true

func _calculate_velocity():
	if Global.player != null and !is_knockedback:
		while player_in_range:	
			return global_position.direction_to(Global.player.global_position)
		return Vector2.ZERO
	else:
		return lerp(_velocity, Vector2.ZERO, 0.3)
	
func _on_CollectionBox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		Global.score += 1
		health = 0


func _on_KnockbackTimer_timeout() -> void:
	is_knockedback = false
	
