extends Node2D
class_name Weapon

@export var weapon_data:WeaponData
@export var weapon_flip_offset:float


var hand_resting_pos:Vector2
enum directions {
	LEFT,
	RIGHT
}

# Called when the node enters the scene tree for the first time.
func _enter_tree() -> void:
	hand_resting_pos = get_parent().position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func damage_enemies(enemies:Array[Node2D]):
	for enemy in enemies:
		if enemy.is_in_group("enemy"):
			enemy.health -= weapon_data.damage

func flip_weapon(direction:directions):
	print(hand_resting_pos)
	if direction == directions.LEFT:
		position.x = -weapon_flip_offset
	elif direction == directions.RIGHT:
		position.x = 0
		
