extends CharacterBody2D
class_name Enemy

var health:int = 100:
	set(value):
		health = value
		print(health)
		if health <= 0:
			health_depleted.emit()
			queue_free()


signal health_depleted

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
