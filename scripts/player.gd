class_name Player

extends CharacterBody2D

const JUMP_VELOCITY = -500.0

@onready var sprite: AnimatedSprite2D = $Sprite

var toggleFlying: bool = false

func _physics_process(delta: float) -> void:
	# Handle jump.
	if Input.is_action_pressed("jump"):
		self.velocity = Vector2(0, JUMP_VELOCITY)
		toggleFlying = true
	else:
		self.velocity += get_gravity() * delta
		if is_on_floor():
			toggleFlying = false

	if toggleFlying:
		sprite.play("flying")
	else:
		sprite.play("running")


	move_and_slide()