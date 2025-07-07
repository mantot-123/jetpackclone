class_name Ground

extends StaticBody2D

var scroll: float = 0.0
var scrollSpeed: float

@onready var hitbox: Hitbox = $Hitbox

func _ready() -> void:
	hitbox.isHit.connect(_onHitboxIsHit)	

func _process(delta: float) -> void:
	self.position.x += -1 * scrollSpeed * delta
	scroll += scrollSpeed * delta
	if scroll >= 765.0:
		scroll = 0.0
		self.position.x = -765.0

func _onHitboxIsHit(body: Node2D) -> void:
	if body is Bullet:
		body.bulletHit.emit()
