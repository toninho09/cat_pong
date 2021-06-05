extends Node2D

onready var score1_text = $Score/Score1
onready var score2_text = $Score/Score2

onready var ball_duplicated = preload("res://src/Ball.tscn")
onready var ball = $Ball

var ball_original_position = Vector2.ZERO

var score1 = 0
var score2 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	ball_original_position = ball.position
	update_score()


func update_score():
	score1_text.text = "%d" % score1
	score2_text.text = "%d" % score2
	
func reset_ball():
	ball.queue_free()
	ball = ball_duplicated.instance()
	ball.position = ball_original_position
	add_child(ball)


func _on_Blue_body_entered(body):
	if body.is_in_group("ball"):
		score2 += 1
		update_score()
		reset_ball()


func _on_Red_body_entered(body):
	if body.is_in_group("ball"):
		score1 += 1
		update_score()
		reset_ball()
