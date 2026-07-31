extends Area2D

signal hit

enum Players {
	PLAYER_1,
	PLAYER_2,
	}

@export var player: Players

var VELOCITY: int = 200
var score: int = 0

func _process(delta: float) -> void:
	var MOVE_UP: String = "Player_1_move_up" if player == Players.PLAYER_1 else "Player_2_move_up"			# Why does it only work if placed here and not when put outside of functions
	var MOVE_DOWN: String = "Player_1_move_down" if player == Players.PLAYER_1 else "Player_2_move_down"
	if Input.is_action_pressed(MOVE_UP):
		self.position += Vector2(0, -VELOCITY) * delta
	if Input.is_action_pressed(MOVE_DOWN):
		self.position += Vector2(0, VELOCITY) * delta


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	hit.emit()

func win() -> void:
	self.score += 1
