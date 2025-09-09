extends Item

const NEW_RESOURCE = preload("res://Resources/new_resource.tres")

func _on_picked_up() -> void:
	var player = get_tree().get_first_node_in_group("player")
	player.traps_loader.add_trap(NEW_RESOURCE)
