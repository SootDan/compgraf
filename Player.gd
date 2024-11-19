extends Node3D

var velocity := 2.0
var is_on_floor := true
@onready var start_y = position.y

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Forward"):
		position.z += velocity * delta
	if Input.is_action_pressed("Left"):
		position.x += velocity * delta
	if Input.is_action_pressed("Right"):
		position.x -= velocity * delta
	if Input.is_action_pressed("Backward"):
		position.z -= velocity * delta
	if Input.is_action_pressed("Jump") and is_on_floor:
		position.y += velocity

	if not is_on_floor:
		position.y -= velocity * 0.5 * delta
	is_on_floor = position.y <= start_y

func _input(event):
	if event.is_action("Backward"):
		pass
	pass
	
