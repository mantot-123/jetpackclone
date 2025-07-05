class_name GameManager

extends Node2D

signal gameOver

var score: int = 0

@export var obstacleScrollSpeed: float = 400.0
@onready var obstacles: Obstacles = $Obstacles
@onready var scoreTimer: Timer = $ScoreTimer
@onready var scoreLabel: Label = $ScoreLabel

func _ready() -> void:
	gameOver.connect(_onGameOver)
	scoreTimer.timeout.connect(_onScoreTimerTimeout)
	obstacles.scrollSpeed = obstacleScrollSpeed


func _process(delta: float) -> void:
	scoreLabel.text = "Score: " + str(score)


func _onGameOver() -> void:
	var gameOverScene: PackedScene = preload("res://scenes/game_over_screen.tscn")
	var gameOver: Node2D = gameOverScene.instantiate()
	gameOver.score = score
	# Clears the current "Game" from the scene tree + replace it with the "Game over" scene
	self.get_tree().current_scene.queue_free()
	self.get_tree().get_root().add_child(gameOver)
	self.get_tree().current_scene = gameOver


func _onScoreTimerTimeout() -> void:
	score += 1
