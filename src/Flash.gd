extends Node2D


func _on_Lifetime_timeout() -> void:
	queue_free()
