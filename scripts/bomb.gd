class_name Bomb

extends Area2D

var currentGame: GameManager

signal bombContact

func _ready() -> void:
	currentGame = self.get_tree().current_scene # Get the currently open "Game" scene
	body_entered.connect(_onBombContact)

func _onBombContact(body: Node2D) -> void:
	if body is Player:
		currentGame.gameOver.emit() # Sends a "game over" signal to the current game manager
