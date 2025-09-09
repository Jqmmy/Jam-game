extends Node2D
class_name Trap
#add code to place place trap as base code
@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var node_2d: Node2D = $Node2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D

@export var placing_color:Color
@export var trap_name:String

var placing:bool = true

##emits when trap is placed
signal placed(trap_name:String)
signal cancled

func _ready() -> void:
	sprite_2d.modulate = placing_color

func _process(delta: float) -> void:
	if placing:
		global_position = get_global_mouse_position()
		if ray_cast_2d.is_colliding():
			node_2d.global_position = ray_cast_2d.get_collision_point()
		else:
			node_2d.position = Vector2.ZERO
	
	if Input.is_action_just_pressed("use weapon"):
		if ray_cast_2d.is_colliding():
			var place_point = ray_cast_2d.get_collision_point()
			global_position = place_point
			sprite_2d.modulate = Color(1.0, 1.0, 1.0, 1.0)
			node_2d.position = Vector2.ZERO
			placing = false
			placed.emit(trap_name)
	
	if Input.is_action_just_pressed("cancel trap") and placing:
		cancled.emit()
		queue_free()
