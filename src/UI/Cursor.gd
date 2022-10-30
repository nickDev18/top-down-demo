extends Node2D

onready var anim = $AnimatedSprite


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	anim.play("Default")

# warning-ignore:unused_argument
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()



#func _on_DetectionArea_area_entered(area: Area2D) -> void:
#	if area.is_in_group("Enemy"):
#		anim.play("Hover")
#
#
#func _on_DetectionArea_area_exited(area: Area2D) -> void:
#	if area.is_in_group("Enemy"):
#		anim.play("Default")

