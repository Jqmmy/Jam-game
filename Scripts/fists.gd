extends Weapon


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	used_weapon.connect(on_used_weapon)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_used_weapon():
	pass
