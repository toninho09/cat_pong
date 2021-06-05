extends KinematicBody2D

var velocity = Vector2(100,100)

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	velocity = Vector2(rng.randf_range(60,120),rng.randf_range(60,120))
	if rng.randf() < 0.5:
		velocity *= -1 

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
		velocity *= 1.01
