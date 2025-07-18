extends CharacterBody3D

var movement_input := Vector2.ZERO
var speed_movement

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func movement(delta: float) -> void:
	movement_input = Input.get_vector("left", "right", "forward", "backward")
	#1. Current movement speed du player
	var velocity_2d := Vector2(velocity.x, velocity.z)
	
	if movement_input != Vector2.ZERO:
		#2.1 slowly accelerating from ur current speed vers la direction de l'input
		velocity_2d += movement_input * speed_movement * delta * 8.0
	else :
		#permet de ralentir le perso lorsqu'il y a pas d'input
		#3.1 get our current speed and change it to zero
		#base_speed * 4.0 * delta c'est la vitesse à laquelle
		#la vitesse du player va atteindre 0
		velocity_2d = velocity_2d.move_toward(Vector2.ZERO, speed_movement * 4.0 * delta)
