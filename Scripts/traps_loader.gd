extends Node

@onready var traps_container: HBoxContainer = $"../CanvasLayer/Control/traps container"
var placing_trap:bool = false


var traps:Dictionary = {
	
}

func add_trap(trap_data:TrapData):
	if traps.has(trap_data.trap_name.to_lower()):
		traps[trap_data.trap_name.to_lower()]["amount"] += 1
		traps[trap_data.trap_name.to_lower()]["ui"].amount_label.text = str(traps[trap_data.trap_name.to_lower()]["amount"])
	else:
		var trap_ui = preload("res://Prefabs/traps/trap template/trap UI.tscn").instantiate()
		traps[trap_data.trap_name.to_lower()] = {"amount" = 1, "resource" = trap_data, "ui" = trap_ui}
		var trap = traps[trap_data.trap_name.to_lower()]["resource"] as TrapData
		traps_container.add_child(trap_ui)
		trap_ui.initiate_ui(trap.texture, trap.trap_name, traps[trap_data.trap_name.to_lower()]["amount"])
		trap_ui.selected_trap.connect(use_trap)


func use_trap(trap_name:String):
	if !placing_trap:
		placing_trap = true
		var trap_selction = traps[trap_name]["resource"].trap_scene.instantiate() as Trap
		trap_selction.placed.connect(used_trap)
		trap_selction.cancled.connect(func(): placing_trap = false)
		add_child(trap_selction)
	

func used_trap(trap_name:String):
	placing_trap = false
	traps[trap_name]["amount"] -= 1
	if traps[trap_name]["amount"] <= 0:
		traps[trap_name]["ui"].queue_free()
		traps.erase(trap_name)
	else:
		traps[trap_name]["ui"].amount_label.text = str(traps[trap_name]["amount"])
	
