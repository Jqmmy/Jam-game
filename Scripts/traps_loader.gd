extends Node

@onready var traps_container: HBoxContainer = $"../CanvasLayer/Control/traps container"

var traps:Dictionary = {
	
}

func add_trap(trap_data:TrapData):
	if traps.has(trap_data.trap_name.to_lower()):
		traps[trap_data.trap_name.to_lower()]["amount"] += 1
	else:
		var trap_ui = preload("res://Prefabs/traps/trap template/trap UI.tscn").instantiate()
		traps[trap_data.trap_name.to_lower()] = {"amount" = 1, "resource" = trap_data}
		var trap = traps[trap_data.trap_name.to_lower()]["resource"] as TrapData
		traps_container.add_child(trap_ui)
		trap_ui.initiate_ui(trap.texture, trap.trap_name)
		trap_ui.selected_trap.connect(use_trap)


func use_trap(trap_name:String):
	var trap_selction = traps[trap_name]["resource"].trap_scene.instantiate() as Trap
	trap_selction.placed.connect(used_trap)
	add_child(trap_selction)
	

func used_trap():
	pass
