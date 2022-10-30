extends Node

var enemy = preload("res://src/Enemy.tscn")
onready var enemy_position = $SpawnPath/EnemySpawnPoints 
export var difficulty_ramp = 0.1

func _ready() -> void:
	randomize()
	Global.node_parent = self
	Global.score = 0
	Global.scene_tree = get_tree()

func _exit_tree() -> void:
	Global.node_parent = null


func _on_EnemySpawnTimer_timeout() -> void:
	enemy_position.unit_offset = randf()
# warning-ignore:return_value_discarded
	Global.instantiate(enemy, enemy_position.position, self, 1)


func _on_difficultyTimer_timeout() -> void:
	if $EnemySpawnTimer.wait_time > 0.5:
		$EnemySpawnTimer.wait_time -= difficulty_ramp
	
