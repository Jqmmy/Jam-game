extends Node2D
class_name Weapon

@export var weapon_data:WeaponData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func damage_enemies(enemies:Array[Node2D]):
	for enemy in enemies:
		if enemy.is_in_group("enemy"):
			enemy.health -= weapon_data.damage
