extends Control

@onready var label: Label = $Label
@onready var amount_label: Label = $Label2
@onready var button: Button = $Button

signal selected_trap(trap_name:String)

var trap:String

func _on_button_button_down() -> void:
	selected_trap.emit(trap)

func initiate_ui(texture:Texture2D, trap_name:String):
	trap = trap_name.to_lower()
	label.text = trap_name
	button.icon = texture
