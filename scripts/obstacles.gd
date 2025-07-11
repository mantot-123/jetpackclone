class_name ObstaclesSpawnArea
extends Node2D

@onready var bombSpawnTimer: Timer = $BombSpawnTimer

var scrollSpeed: float
var scroll: float = 0.0
var maxSpawnTime: float = 3.5

func _ready() -> void:
	bombSpawnTimer.timeout.connect(spawnBomb)

func _process(delta: float) -> void:
	self.position.x += -1 * scrollSpeed * delta
	scroll += scrollSpeed * delta

func spawnBomb() -> void:
	var bombScene: PackedScene = preload("res://scenes/bomb.tscn") 
	var bomb: Bomb = bombScene.instantiate()
	bomb.global_position = Vector2(800 + scroll, randf_range(-300, 50))
	self.get_tree().current_scene.get_node("Obstacles").add_child(bomb)
	bombSpawnTimer.start(randf_range(0.00, maxSpawnTime))
