extends CanvasLayer

@onready var score_label: Label = $ScoreMarginContainer/HBoxContainer/ScoreText

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#connect le script Globals
	Globals.connect("stat_change", update_score_text)
	update_score_text()

func update_score_text() -> void :
	score_label.text = str(Globals.score_amount)
	#pop_text()
#
#func pop_text() -> void:
	#var tween := create_tween()
	#tween.tween_property(score_label, "font_size", 36, 1.0)
	#tween.tween_property(score_label, "font_size", 12, 0.3).set_ease(Tween.EASE_OUT)
