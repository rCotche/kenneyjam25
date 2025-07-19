extends Area3D

var rotation_speed: int = 5
#power up type
var available_options := ['heal', 'damage']
#randomize power up
var type = available_options[randi()%len(available_options)]

#func _process(delta: float) -> void:
	##to fix
	##rotation += rotation_speed * delta
	#pass

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		apply_effect(body)
		print("pick up")


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		apply_effect(body)
		print("nope")

func apply_effect(_player) -> void:
	# Exemple : augmenter une stat du joueur
	# player.add_mana(10)
	pass
