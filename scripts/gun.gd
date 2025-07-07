class_name Gun

extends Node2D

@onready var shootTimer: Timer = $ShootTimer
var shootTimerRunning: bool = false

func _ready() -> void:
	shootTimer.timeout.connect(_onShootTimerTimeout)

func _process(delta: float) -> void:
	if Input.is_action_pressed("jump"):
		if not shootTimerRunning:
			shootTimer.start()
			shootTimerRunning = true
	else:
		shootTimer.stop()
		shootTimerRunning = false

func _onShootTimerTimeout() -> void:
	_fire()

func _fire() -> void:
	var bulletScene: PackedScene = preload("res://scenes/bullet.tscn")
	var bullet: Node2D = bulletScene.instantiate()
	bullet.global_position = self.global_position
	self.get_tree().current_scene.add_child(bullet)
	

	
