extends RigidBody2D

export(Array, StreamTexture) var textures
export(String) var prefix
export(int) var velocity = 500

onready var sprite = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	sprite.texture = textures[rng.randi_range(0,textures.size() - 1)]
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_up_" + prefix):
		rotation_degrees = clamp(rotation_degrees - (delta * velocity) * scale.y, 20, 160)
	if Input.is_action_pressed("move_down_" + prefix):
		rotation_degrees = clamp(rotation_degrees + (delta * velocity) * scale.y, 20, 160)
