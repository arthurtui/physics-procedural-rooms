extends RigidBody2D

var color = Color(1, 1, 1)
var size = Vector2(100, 100)

func generate(position, size, color):
	self.position = position
	self.size = size
	self.color = color
	
	var s = RectangleShape2D.new()
	s.extents = size
	s.custom_solver_bias = .75
	$CollisionShape2D.shape = s
	
	contact_monitor = true
	contacts_reported = 10


func _draw():
	draw_rect(Rect2(-size, size * 2), color)
	draw_rect(Rect2(-size, size * 2), Color(0, 0, 0), false)
