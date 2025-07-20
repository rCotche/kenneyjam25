extends Node

#UI INTERACT
@onready var ui_scene_res: Node = $UI
var pickup_label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#UI INTERACT
	#pickup_label = ui_scene_res.get_node_or_null("PickupControl/Label")
	#if not pickup_label:
		#push_warning("PickupLabel introuvable.")
	
	#CONNECT SIGNAL
	#le groupe "GroupPowerUp" a tous les nodes power up
	#get tous les intances de node qui est dans le groupe
	#for powerup in get_tree().get_nodes_in_group("GroupPowerUp"):
		#powerup.powerup_near.connect(on_powerup_powerupnear)
#
#func on_powerup_powerupnear(near: bool) -> void:
	#pickup_label.visible = near
