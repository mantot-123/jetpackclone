class_name Bomb

extends Area2D

var currentGame: GameManager
@onready var hitbox: Hitbox = $Hitbox

signal bombContact

func _ready() -> void:
	currentGame = self.get_tree().current_scene # Get the currently open "Game" scene
	body_entered.connect(_onBombContact)
	hitbox.isHit.connect(_onBombContact)

func _onBombContact(body: Node2D) -> void:
	if body is Player:
		currentGame.gameOver.emit() # Sends a "game over" signal to the current game manager
	elif body is Bullet:
		body.bulletHit.emit()
		self.queue_free() # Remove the bomb from the scene tree

