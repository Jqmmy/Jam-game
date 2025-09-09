extends Item

@onready var name_label: Label = $"SubViewport/Control/VBoxContainer/name label"
@onready var control: Control = $SubViewport/Control

var shotgun = preload("res://Prefabs/weapons/shotgun.tscn").instantiate()

func _ready() -> void:
	control.hide()
	name_label.text = shotgun.name


func _on_picked_up() -> void:
	var player = get_tree().get_first_node_in_group("player")
	player.add_weapon(shotgun)

func _on_mouse_entered() -> void:
	control.show()

func _on_mouse_exited() -> void:
	control.hide()
