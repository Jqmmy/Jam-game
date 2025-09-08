extends Node2D
class_name Trap
#add code to place place trap as base code
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D

@export var placing_color:Color

var placing:bool = true

##emits when trap is placed
signal placed

func _ready() -> void:
	sprite_2d.modulate = placing_color

func _process(delta: float) -> void:
	if placing:
		global_position = get_global_mouse_position()
		if ray_cast_2d.is_colliding():
			sprite_2d.global_position = ray_cast_2d.get_collision_point()
		else:
			sprite_2d.position = Vector2.ZERO
	
	if Input.is_action_just_pressed("use weapon"):
		if ray_cast_2d.is_colliding():
			var place_point = ray_cast_2d.get_collision_point()
			global_position = place_point
			sprite_2d.modulate = Color(1.0, 1.0, 1.0, 1.0)
			sprite_2d.position = Vector2.ZERO
			placing = false
			placed.emit()
	
	if Input.is_action_just_pressed("cancel trap"):
		queue_free()
