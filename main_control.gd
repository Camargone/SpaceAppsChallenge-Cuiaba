extends Control

export (NodePath) var button_path
onready var button = get_node(button_path)

func _ready():
	button.set_text("Iniciar")
	pass

