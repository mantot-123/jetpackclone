class_name Player

extends CharacterBody2D

const JUMP_VELOCITY = -500.0

@export var currentGame: GameManager

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

var toggleFlying: bool = false
var isLost: bool = false

func _physics_process(delta: float) -> void:
	if not isLost:
		# Handle jumping and flying
		if Input.is_action_pressed("jump"):
			self.velocity = Vector2(0, JUMP_VELOCITY)
			toggleFlying = true
		else:
			self.velocity += 2 * get_gravity() * delta
			if is_on_floor():
				toggleFlying = false

		if toggleFlying:
			sprite.play("flying")
		else:
			sprite.play("running")
	else:
		self.velocity = Vector2.ZERO

	move_and_slide()


func lose():
	currentGame.gameOver.emit() # Sends a "game over" signal to the current game manager
