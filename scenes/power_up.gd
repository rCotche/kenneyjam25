extends Area3D

#POWER UP DESCRIPTION
var rotation_speed: int = 5
#power up type
var available_options := ['heal', 'damage']
#randomize power up
var type = available_options[randi()%len(available_options)]

@export var points : int = 0

#
signal powerup_near(near: bool)

#func _process(delta: float) -> void:
	##to fix
	##rotation += rotation_speed * delta
	#pass

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		powerup_near.emit(true)
		Globals.score_amount += points
		queue_free()

func apply_effect(_player) -> void:
	# Exemple : augmenter une stat du joueur
	# player.add_mana(10)
	pass
