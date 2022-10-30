extends Entity

export var kill_score : int
export var screen_shake_amount: float

var stun = false

var blood_particles = preload("res://src/bloodParticles.tscn")
var blood_splat = preload("res://src/bloodSplat.tscn")
var peel = preload("res://src/Peel.tscn")

func _calculate_velocity():
	if Global.player != null and stun == false:
		return global_position.direction_to(Global.player.global_position)
	else:
		return lerp(_velocity, Vector2.ZERO, 0.3)


func _on_Hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet") and stun == false:
		var bullet = area.get_parent()
		bullet.health -= 1
		stun = true
		material.set_shader_param("flash_modifier", 1)
		$StunTimer.start()
		_velocity = -_velocity * 20
		health -= bullet.damage
		blood_splatter(blood_splat)
		if Global.camera != null:
			Global.camera.screen_shake(screen_shake_amount, 0.1)
		
	
func _on_StunTimer_timeout() -> void:
	material.set_shader_param("flash_modifier", 0)
	stun = false
	
func _destroy():
	if Global.node_parent != null:
		blood_splatter(blood_particles)
		var collectable_node = Global.instantiate(peel, global_position, Global.node_parent, 1)
		collectable_node._velocity = _velocity
	._destroy()

func blood_splatter(particles):
	var blood_particle_instance = Global.instantiate(particles, global_position, Global.node_parent, 1)
	blood_particle_instance.rotation = _velocity.angle()

func _process(_delta: float) -> void:
	if Global.player.visible == true:
		var angle = global_position.angle_to_point(Global.player.global_position)
		if abs(angle) > PI/2:
			scale.x = 1
		else:
			scale.x = -1
