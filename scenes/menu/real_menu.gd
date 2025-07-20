extends Control

@export var game_scene: PackedScene
@export var credit_scene: PackedScene

func _on_play_btn_pressed() -> void:
	$SFX.play()
	get_tree().change_scene_to_packed(game_scene)

func _on_quit_btn_pressed() -> void:
	$SFX.play()
	get_tree().change_scene_to_packed(credit_scene)

func _on_credit_pressed() -> void:
	$SFX.play()
	get_tree().quit()
