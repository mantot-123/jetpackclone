extends StaticBody2D

var scroll: float = 0.0
var scrollSpeed: float

func _process(delta: float) -> void:
	self.position.x += -1 * scrollSpeed * delta
	scroll += scrollSpeed * delta
	if scroll >= 765.0:
		scroll = 0.0
		self.position.x = -765.0
