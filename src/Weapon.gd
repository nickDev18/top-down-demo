extends Node2D

onready var bullet = preload("res://src/Bullet.tscn")
onready var flash = preload("res://src/Flash.tscn")
onready var anim = $AnimationPlayer
var canShoot = true
export var screen_shake_amount: float

# warning-ignore:unused_argument
func _process(delta: float) -> void:
	var input_dir = Global.get_input_dir()
	look_at(input_dir)
	if Input.is_action_pressed("shoot") and canShoot:
		var instantiated_bullet: = Global.instantiate(bullet, $Position2D.global_position, Global.node_parent, 1)
# warning-ignore:return_value_discarded
		Global.instantiate(flash, $Position2D.global_position, Global.node_parent, 1)
		instantiated_bullet.set_shoot_dir(input_dir)
		$shotCooldown.start()
		anim.play("Shoot")
		canShoot = false
#		if Global.camera != null:
#			Global.camera.screen_shake(screen_shake_amount, 0.1)

func _on_shotCooldown_timeout() -> void:
	canShoot = true
