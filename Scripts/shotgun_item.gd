extends Item

const SHOTGUN = preload("res://Prefabs/weapons/shotgun.tscn")

func _on_picked_up() -> void:
	var player = get_tree().get_first_node_in_group("player")
	player.add_weapon(SHOTGUN.instantiate())
