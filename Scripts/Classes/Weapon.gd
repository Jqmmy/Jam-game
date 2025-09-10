extends Node2D
class_name Weapon

@export var weapon_name:String
@export_multiline var description:String
@export var damage:int = 10
@export var reload_speed:float
@export var rate_of_fire:float
@export var texture_width:float
@export var sprite2d:Sprite2D



var hands_resting_pos:Vector2
var hands
var current_weapon:bool = true
enum directions {
	LEFT,
	RIGHT
}

signal used_weapon
signal holding_use

# Called when the node enters the scene tree for the first time.
func _enter_tree() -> void:
	hands_resting_pos = get_parent().position
	hands = get_parent()

func _input(_event: InputEvent) -> void:
	if current_weapon:
		if Input.is_action_just_pressed("use weapon"):
			used_weapon.emit()
		if Input.is_action_pressed("use weapon"):
			holding_use.emit()

func flip_weapon(direction:directions):
	if direction == directions.LEFT:
		hands.position.x = -hands_resting_pos.x
		#replace the assignment with sprite2d.texture.get_width() in the future
		sprite2d.position.x = texture_width
		sprite2d.flip_h = true
	elif direction == directions.RIGHT:
		hands.position.x = hands_resting_pos.x
		sprite2d.position.x = 0
		sprite2d.flip_h = false
