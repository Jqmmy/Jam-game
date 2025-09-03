extends Node2D
class_name Weapon

@export var weapon_name:String
@export_multiline var description:String
@export var damage:int = 10
@export var weapon_flip_offset:float
@export var sprite2d:Sprite2D


var hand_resting_pos:Vector2
enum directions {
	LEFT,
	RIGHT
}

signal used_weapon
signal holding_use

# Called when the node enters the scene tree for the first time.
func _enter_tree() -> void:
	hand_resting_pos = get_parent().position

func _input(_event: InputEvent) -> void:
	if !Engine.is_editor_hint():
		if Input.is_action_just_pressed("use weapon"):
			used_weapon.emit()
		if Input.is_action_pressed("use weapon"):
			holding_use.emit()

func flip_weapon(direction:directions):
	if direction == directions.LEFT:
		position.x = -weapon_flip_offset
	elif direction == directions.RIGHT:
		position.x = 0
			
