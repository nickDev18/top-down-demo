extends Node2D

onready var score_label = $Control/Score
onready var high_score_label = $Control/Highscore
onready var pause_overlay: ColorRect = $Control/PauseOverlay

var paused: = false setget set_paused

func _ready() -> void:
	pause_overlay.visible = false
	if Global.highscore == 0:
		high_score_label.text = " "
	else:
		high_score_label.text = str(Global.highscore)

# warning-ignore:unused_argument
func _process(delta: float) -> void:
	score_label.text = str(Global.score)
	if Global.score > Global.highscore:
		Global.highscore = Global.score
	if pause_overlay.visible:
		self.paused = true

func set_paused(value: bool) -> void:
	paused = value
	Global.scene_tree.paused = value

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = not paused
		pause_overlay.visible = paused
		Global.scene_tree.set_input_as_handled()
		
		
