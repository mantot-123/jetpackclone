extends Node2D

var score: int

@onready var scoreLabel: Label = $ScoreLabel

func _process(delta: float) -> void:
	scoreLabel.text = "Score: " + str(score)