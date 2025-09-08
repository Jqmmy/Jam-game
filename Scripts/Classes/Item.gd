extends RigidBody2D
class_name Item


@export_enum("auto_pickup", "click_pickup") var item_pickup_method:int = 0
@export var auto_pickup_threshhold:float = 100
@export var float_torwards_player:bool = false
@onready var sprite_2d: Sprite2D = $Sprite2D

var initiated_pick_up:bool = false

signal picked_up


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if item_pickup_method == 0:
		var player = get_tree().get_first_node_in_group("player")
		if player.global_position.distance_to(global_position) < auto_pickup_threshhold:
			initiated_pick_up = true

#add code to go torwards player
func _physics_process(delta: float) -> void:
	if initiated_pick_up:
		if float_torwards_player:
			var player = get_tree().get_first_node_in_group("player")
			var tween = get_tree().create_tween()
			var rand = RandomNumberGenerator.new()
			set_collision_mask_value(1, false)
			tween.tween_property(self, "global_position", player.global_position, rand.randf_range(0.3, 0.7)).set_ease(Tween.EASE_OUT)
			tween.finished.connect(func():
				picked_up.emit()
				queue_free())
		else:
			picked_up.emit()
			queue_free()

func pick_up():
	if item_pickup_method == 1:
		initiated_pick_up = true
