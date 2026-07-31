extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$PlayerScores.text = "{player_1_score} | {player_2_score}".format({"player_1_score": $Paddle.score, "player_2_score": $Paddle2.score})

func new_game() -> void:
	$Ball.start_game()	

func _on_area_2d_2_miss() -> void:
	$GameOverTimeout.start()
	$Paddle.win()

func _on_area_2d_miss() -> void:
	$GameOverTimeout.start()
	$Paddle2.win()

func _on_paddle_2_hit() -> void:
	$Ball.bounce("vertical")

func _on_paddle_hit() -> void:
	$Ball.bounce("vertical")

func _on_game_over_timeout_timeout() -> void:
	$Ball.position = Vector2(576.5, 324.5)
	new_game()
