extends Entity

var is_dead = false

onready var anim = $AnimationPlayer


func _ready() -> void:
	Global.player = self
	

func _calculate_velocity():
	if !is_dead:
		var out = Vector2.ZERO
		out.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		out.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		return out.normalized()
	else:
		return Vector2.ZERO

func _on_Hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy") and !is_dead:
		is_dead = true
		$Weapon.queue_free()
		visible = false
		$DeathTimer.start()

func _on_DeathTimer_timeout() -> void:
	Global.restart_scene()
	
# warning-ignore:unused_argument
func _process(delta: float) -> void:
	if Global.get_input_dir() < global_position:
		scale.x = -1
	else:
		scale.x = 1
		
	if _velocity.length() > 0:
		anim.play("Run")
	else:
		anim.play("Idle")


func _on_CollectionBox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Collectable"):
		area.get_parent().player_in_range = true


func _on_CollectionBox_area_exited(area: Area2D) -> void:
	if area.is_in_group("Collectable"):
		area.get_parent().player_in_range = false
