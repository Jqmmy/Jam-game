extends Area2D
class_name Ladder

@export var ladder_speed:float = 225.0

var ladder_target:Node2D
var active_body:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	set_collision_mask_value(3, true)

func _physics_process(delta: float) -> void:
	if active_body:
		var ladder_dir = Input.get_axis("interact 2","interact 3")
		if ladder_dir:
			ladder_target.velocity.y = ladder_dir * ladder_speed
		else:
			ladder_target.velocity.y = 0

func _on_body_entered(body:Node2D):
	print(body)
	if body.is_in_group("player"):
		body.on_ladder = true
		ladder_target = body
		active_body = true

func _on_body_exited(body:Node2D):
	if body.is_in_group("player"):
		body.on_ladder = false
		active_body = false
