extends Camera2D

var screen_shake_start = false
var shake_intensity = 0

var start_pos

func _ready() -> void:
	Global.camera = self
	start_pos = get_viewport_rect().size/2

func _exit_tree() -> void:
	Global.camera = null
	
func _process(delta: float) -> void:
	zoom = lerp(zoom, Vector2.ONE, 0.3)
	
	if screen_shake_start == true:
		global_position += Vector2(rand_range(-shake_intensity, shake_intensity), rand_range(-shake_intensity, shake_intensity)) * delta
	else:
		global_position = lerp(global_position, start_pos, 0.3)
		
func screen_shake(intensity, time):
	zoom = Vector2.ONE - Vector2(intensity * 0.002, intensity * 0.002)
	shake_intensity = intensity
	$shake_timer.wait_time = time
	$shake_timer.start()
	screen_shake_start = true


func _on_shake_timer_timeout() -> void:
	screen_shake_start = false
