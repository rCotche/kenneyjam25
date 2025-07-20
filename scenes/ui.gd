extends CanvasLayer

@onready var score_label: Label = $ScoreMarginContainer/HBoxContainer/ScoreText

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#connect le script Globals
	Globals.connect("stat_change", update_score_text)
	update_score_text()

func update_score_text() -> void :
	score_label.text = str(Globals.score_amount)
