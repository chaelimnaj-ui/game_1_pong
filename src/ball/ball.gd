extends Area2D

var velocity: int
var dir: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position += dir * delta * velocity

func bounce(surface: String):
	if surface == "vertical":
		self.dir.x = -self.dir.x
	elif surface == "horizontal":
		self.dir.y = -self.dir.y

func start_game():
	var init_vel: Array[int] = [-1, 1]
	velocity = 400
	dir = Vector2(init_vel.pick_random(), init_vel.pick_random()).normalized()

func _on_bottom_screen_exited() -> void:
	bounce("horizontal")

func _on_top_screen_exited() -> void:
	bounce("horizontal")
