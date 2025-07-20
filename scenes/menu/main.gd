extends Control

@export var game_scene: PackedScene
@export var credit_scene: PackedScene

func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)


func _on_credit_pressed() -> void:
	get_tree().change_scene_to_packed(credit_scene)


func _on_quit_pressed() -> void:
	get_tree().quit()
