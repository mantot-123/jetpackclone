class_name GameManager

extends Node2D

signal gameOver

var score: int = 0
var lastCheckpointScore: int = 0 

@export var gameScrollSpeed: float = 500.0

@onready var ground: StaticBody2D = $Ground
@onready var obstacles: ObstaclesSpawnArea = $Obstacles
@onready var scoreTimer: Timer = $ScoreTimer
@onready var scoreLabel: Label = $ScoreLabel

func _ready() -> void:
	gameOver.connect(_onGameOver)
	scoreTimer.timeout.connect(_onScoreTimerTimeout)
	# Set scroll speed for ground and obstacles
	ground.scrollSpeed = gameScrollSpeed
	obstacles.scrollSpeed = gameScrollSpeed


func _process(delta: float) -> void:
	scoreLabel.text = "Score: " + str(score)
	# Scroll speed increases by 50 to increase difficulty
	if score == lastCheckpointScore + 100:
		gameScrollSpeed += 100.0
		lastCheckpointScore = score
		obstacles.maxSpawnTime -= 0.25 # Decrease max spawn time of the obstacles
		obstacles.maxSpawnTime = clamp(obstacles.maxSpawnTime, 0.75, 3.5) # Prevents the spawn time from going below 0.75 seconds
	ground.scrollSpeed = gameScrollSpeed
	obstacles.scrollSpeed = gameScrollSpeed


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
