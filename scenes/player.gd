extends CharacterBody3D

#PLAYER MOVE
var movement_input := Vector2.ZERO
@export var speed_movement : float = 5.0
@export var max_speed_movement : float = 10.0
#jump
@export var jump_height : float = 2.25
@export var jump_time_to_peak : float = 0.4
@export var jump_time_to_descent : float = 0.3

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0
# source: https://youtu.be/IOe1aGY6hXA?feature=shared

#POWER UP
var _near_count: int = 0
var is_near_powerup: bool = false
var the_powerup_to_interact_with: Node

#CAMERA
@onready var camera = $CameraController/Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	#ACTION
	movement(delta)
	jump(delta)
	abilities()
	#OBLIGATOIRE pour bouger
	move_and_slide()

#MOVE

func movement(delta: float) -> void:
	movement_input = Input.get_vector("gauche", "droite", "avancer", "reculer").rotated(-camera.global_rotation.y)
	#1. Current movement speed du player
	var velocity_2d := Vector2(velocity.x, velocity.z)
	
	if movement_input != Vector2.ZERO:
		#2.1 slowly accelerating from iur current speed vers la direction de l'input
		velocity_2d += movement_input * speed_movement * delta * 8.0
		#tous les vecteur ont la fonction limit_length
		#2.2 set a maximum speed
		velocity_2d = velocity_2d.limit_length(max_speed_movement)
		#Rappel velocity c'est un vecteur 3d
		#2.3 updating velocity to get a new movement speed
		velocity.x = velocity_2d.x
		velocity.z = velocity_2d.y
		print(movement_input)
	else :
		#permet de ralentir le perso lorsqu'il y a pas d'input
		#3.1 get our current speed and change it to zero
		#base_speed * 4.0 * delta c'est la vitesse à laquelle
		#la vitesse du player va atteindre 0
		velocity_2d = velocity_2d.move_toward(Vector2.ZERO, speed_movement * 4.0 * delta)
		#3.2 updating velocity to get a new movement speed
		velocity.x = velocity_2d.x
		velocity.z = velocity_2d.y

func jump(delta: float) -> void:
	if is_on_floor():
		if Input.is_action_just_pressed("saut"):
			velocity.y = -jump_velocity
	var gravity = jump_gravity if velocity.y > 0.0 else fall_gravity
	velocity.y -= gravity * delta

#ABILITIES

func abilities() -> void:
	damage_ability()
	heal_ability()

func damage_ability() -> void :
	if Input.is_action_just_pressed("damage"):
		print("player damage")

func heal_ability() -> void :
	if Input.is_action_just_pressed("heal"):
		print("player heal")
