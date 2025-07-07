class_name Hitbox

extends Area2D

@export var belongsTo: Node2D

signal isHit

func _ready() -> void:
	body_entered.connect(_onHitboxBodyEntered)

func _onHitboxBodyEntered(body: Node2D) -> void:
	if body is Bullet:
		isHit.emit(body)