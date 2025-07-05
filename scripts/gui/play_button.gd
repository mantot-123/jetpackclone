extends Button

func _ready() -> void:
	button_down.connect(_onButtonDown)

func _onButtonDown() -> void:
	self.get_tree().change_scene_to_file("res://scenes/game.tscn")