extends Weapon

@onready var area_2d: Area2D = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("use weapon") and area_2d.get_overlapping_bodies().size() > 0:
		
		var enemies_shot:int
		for enemy in area_2d.get_overlapping_bodies():
			if enemy.is_in_group("enemy"):
				enemies_shot += 1
		
		for enemy in area_2d.get_overlapping_bodies():
			if enemy.is_in_group("enemy"):
				enemy.health -= damage / enemies_shot
