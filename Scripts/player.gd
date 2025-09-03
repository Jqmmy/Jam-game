extends CharacterBody2D

@onready var camera: Camera2D = %camera
@onready var hands: Node2D = %hands

var health:int = 100

var SPEED = 300.0
var JUMP_VELOCITY = -400.0
var camera_move_offset:float = 75
var camera_move_offset_up:float = 90
var resting_hands_pos:Vector2

var current_weapon:Weapon
var weapon_holster:Dictionary = {
	
}

func _ready() -> void:
	resting_hands_pos = hands.position
	current_weapon = hands.get_child(0)

func _physics_process(delta: float) -> void:
	var tween = get_tree().create_tween()
	if not is_on_floor():
		velocity += get_gravity() * delta
		
		tween.tween_property(camera,"position:y", -camera_move_offset_up, 0.5)
	else:
		tween.tween_property(camera,"position:y", -50, 0.2)

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		
		if direction > 0:
			tween.tween_property(camera,"position:x", camera_move_offset, 0.5)
			current_weapon.flip_weapon(current_weapon.directions.RIGHT)
		else:
			tween.tween_property(camera,"position:x", -camera_move_offset, 0.5)
			current_weapon.flip_weapon(current_weapon.directions.LEFT)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		tween.tween_property(camera,"position:x", 0, 0.5)

	move_and_slide()
