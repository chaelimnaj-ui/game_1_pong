extends Area2D

signal hit

@export var player: String

var VELOCITY: int = 15
var MOVE_UP: String = "Player_1_move_up" if player == "Player_1" else "Player_2_move_up"
var MOVE_DOWN: String = "Player_1_move_down" if player == "Player_1" else "Player_2_move_down"

func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	if Input.is_action_pressed(MOVE_UP):
		self.position += Vector2(0, -VELOCITY)
	if Input.is_action_pressed(MOVE_DOWN):
		self.position += Vector2(0, VELOCITY)



func _on_body_entered(body: Node2D) -> void:
	hit.emit()
