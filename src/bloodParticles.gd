extends CPUParticles2D

export var blood_color: Color

func _ready() -> void:
	color = blood_color

func _on_Freeze_timeout() -> void:
	set_process(false)
	set_physics_process(false)
	set_process_input(false)
	set_process_internal(false)
	set_process_unhandled_input(false)
	set_process_unhandled_key_input(false)
	
