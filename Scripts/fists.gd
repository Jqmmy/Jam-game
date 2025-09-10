extends Weapon

@onready var area_2d: Area2D = $Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	used_weapon.connect(on_used_weapon)

func _process(delta: float) -> void:
	
	if sprite_2d.flip_h == true:
		area_2d.position.x = -60
	else:
		area_2d.position.x = 0

func on_used_weapon():
	for enemy in area_2d.get_overlapping_bodies():
		if enemy.is_in_group("enemy"):
			enemy.health -= damage
