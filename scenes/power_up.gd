extends Area3D

var rotation_speed: int = 5
#power up type
var available_options := ['heal', 'damage']
#randomize power up
var type = available_options[randi()%len(available_options)]

func _process(delta: float) -> void:
	#to fix
	#rotation += rotation_speed * delta
	pass

func _on_area_entered(area: Area3D) -> void:
	#ui appear
	print("pick up")
	#queue_free()


func _on_area_exited(area: Area3D) -> void:
	#ui disappear
	print("nope")
