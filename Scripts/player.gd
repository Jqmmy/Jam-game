extends CharacterBody2D

@onready var camera: Camera2D = %camera

var health:int = 100

var SPEED = 300.0
var JUMP_VELOCITY = -400.0
var camera_move_offset:float = 75
var camera_move_offset_up:float = 90


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
		else:
			tween.tween_property(camera,"position:x", -camera_move_offset, 0.5)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		tween.tween_property(camera,"position:x", 0, 0.5)

	move_and_slide()
