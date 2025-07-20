extends Area3D

#POWER UP DESCRIPTION
@export var rotation_speed: int = 5
#power up type
var available_options := ['heal', 'damage']
#randomize power up
var type = available_options[randi()%len(available_options)]
#POWER UP ACTION
@export var points : int = 10
@onready var animationplayer = $AnimationPlayer
signal powerup_near(near: bool)

func _process(delta: float) -> void:
	rotation.y += rotation_speed * delta

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		powerup_near.emit(true)
		Globals.score_amount += points
		animationplayer.play("pickup") 
