class_name Bomb

extends Area2D

@onready var hitbox: Hitbox = $Hitbox

signal bombContact

func _ready() -> void:
	body_entered.connect(_onBombContact)
	hitbox.isHit.connect(_onBombContact)

func _onBombContact(body: Node2D) -> void:
	if body is Player:
		body.isLost = true
		body.currentGame.gameScrollSpeed = 0.0
		body.animationPlayer.play("defeat")
		self.queue_free()
	elif body is Bullet:
		body.bulletHit.emit()
		self.queue_free() # Remove the bomb from the scene tree
