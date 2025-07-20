extends Node

@onready var menu = $UI/VBoxContainer
var pressed_once = false

func _physics_process(delta: float) -> void:
	menu_display()

func menu_display()-> void:
	if Input.is_action_just_pressed("menu"):
		menu.visible = true
		pressed_once = !pressed_once
	else:
		menu.visible = false
		pressed_once = !pressed_once
