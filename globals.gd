extends Node

signal stat_change

var score_amount := 00:
	get:
		return score_amount
	set(value):
		score_amount = value
		stat_change.emit()
