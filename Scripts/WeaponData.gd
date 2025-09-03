extends Resource
class_name WeaponData

@export var name:String
@export_multiline var description:String
@export var damage:int = 10


#figure out what data type to hint so it can be an export
var texture

func _ready():
	pass
