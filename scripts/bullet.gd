class_name Bullet

extends CharacterBody2D

const MOVE_SPEED: float = 800.0
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

var isMoving: bool = true

signal bulletHit

func _ready() -> void:
	bulletHit.connect(_onBulletHit)

func _process(delta: float) -> void:
	if isMoving:
		self.velocity = Vector2(0, 1) * MOVE_SPEED
	else:
		self.velocity = Vector2.ZERO
	move_and_slide()

func _onBulletHit() -> void:
	isMoving = false
	animationPlayer.play("explode")
